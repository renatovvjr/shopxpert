-- =========================================================
-- ShopXpert - 004_auth_triggers_v2.sql
-- Compatível com o schema real
-- =========================================================

-- =========================================================
-- REMOVE TRIGGER ANTIGO
-- =========================================================

drop trigger if exists on_auth_user_created
on auth.users;

drop function if exists public.handle_new_user();

-- =========================================================
-- FUNÇÃO PRINCIPAL
-- =========================================================

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin

    insert into public.profiles (
        id,
        nome,
        email,
        telefone,
        avatar_url,
        tipo_usuario,
        ativo,
        created_at,
        updated_at
    )
    values (
        new.id,

        coalesce(
            new.raw_user_meta_data ->> 'nome',
            split_part(new.email, '@', 1)
        ),

        new.email,

        new.raw_user_meta_data ->> 'telefone',

        null,

        'CONSUMIDOR',

        true,

        now(),
        now()
    );

    return new;

end;
$$;

-- =========================================================
-- TRIGGER
-- =========================================================

create trigger on_auth_user_created
after insert on auth.users
for each row
execute function public.handle_new_user();

-- =========================================================
-- PROMOVER ADMIN
-- =========================================================

create or replace function public.promover_admin(
    user_email text
)
returns void
language plpgsql
security definer
set search_path = public
as $$
begin

    update public.profiles
    set
        tipo_usuario = 'ADMIN',
        updated_at = now()
    where email = user_email;

end;
$$;

-- =========================================================
-- COMMENTS
-- =========================================================

comment on function public.handle_new_user()
is 'Cria automaticamente apenas o profile após cadastro no Auth';

comment on function public.promover_admin(text)
is 'Promove um usuário existente para ADMIN';

-- =========================================================
-- FIM
-- =========================================================