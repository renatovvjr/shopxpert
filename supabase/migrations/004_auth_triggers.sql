-- =========================================================
-- ShopXpert - 004_auth_triggers.sql
-- Objetivo:
-- Automatizar criação de perfis após cadastro no Auth
-- =========================================================

-- =========================================================
-- FUNÇÃO PRINCIPAL
-- =========================================================

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
    user_role public.user_role;
begin

    user_role :=
        coalesce(
            (new.raw_user_meta_data->>'role')::public.user_role,
            'CONSUMIDOR'
        );

    -- =====================================================
    -- PROFILE
    -- =====================================================

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
            new.raw_user_meta_data->>'nome',
            split_part(new.email, '@', 1)
        ),
        new.email,
        new.raw_user_meta_data->>'telefone',
        null,
        user_role,
        true,
        now(),
        now()
    );

    -- =====================================================
    -- CONSUMIDOR
    -- =====================================================

    if user_role = 'CONSUMIDOR' then

        insert into public.consumidores (
            id,
            profile_id,
            premium_ativo,
            total_economizado,
            created_at,
            updated_at
        )
        values (
            gen_random_uuid(),
            new.id,
            false,
            0,
            now(),
            now()
        );

    end if;

    -- =====================================================
    -- LOJISTA
    -- =====================================================

    if user_role = 'LOJISTA' then

        insert into public.lojistas (
            id,
            profile_id,
            nome_fantasia,
            razao_social,
            cnpj,
            status_validacao,
            premium_ativo,
            created_at,
            updated_at
        )
        values (
            gen_random_uuid(),
            new.id,
            coalesce(
                new.raw_user_meta_data->>'nome_fantasia',
                'Novo Lojista'
            ),
            null,
            null,
            'pendente',
            false,
            now(),
            now()
        );

    end if;

    return new;

end;
$$;

-- =========================================================
-- REMOVE TRIGGER ANTIGO
-- =========================================================

drop trigger if exists on_auth_user_created
on auth.users;

-- =========================================================
-- NOVO TRIGGER
-- =========================================================

create trigger on_auth_user_created
after insert on auth.users
for each row
execute function public.handle_new_user();

-- =========================================================
-- FUNÇÃO PARA PROMOVER ADMIN
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
-- VALIDAÇÃO
-- =========================================================

comment on function public.handle_new_user()
is 'Cria automaticamente profiles, consumidores e lojistas após cadastro no Auth';

comment on function public.promover_admin(text)
is 'Promove um usuário existente para ADMIN';

-- =========================================================
-- FIM
-- =========================================================