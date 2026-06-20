-- =========================================================
-- ShopXpert - 006_admin_bootstrap.sql
-- Bootstrap do primeiro administrador
-- =========================================================

-- =========================================================
-- PROMOVER ADMIN PRINCIPAL
-- =========================================================

select public.promover_admin(
    'renatovvjr@gmail.com'
);

-- =========================================================
-- VALIDAÇÃO
-- =========================================================

do $$
declare
    v_count integer;
begin

    select count(*)
    into v_count
    from public.profiles
    where email = 'renatovvjr@gmail.com'
      and tipo_usuario = 'ADMIN';

    if v_count = 0 then
        raise exception
        'Administrador não encontrado ou não promovido.';
    end if;

end $$;

-- =========================================================
-- FIM
-- =========================================================