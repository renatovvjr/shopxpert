-- =========================================================
-- ShopXpert - 002_rls.sql
-- Supabase / PostgreSQL
-- Versão: 1.0
-- Objetivo: habilitar RLS e criar políticas por perfil
-- Perfis: ADMIN, CONSUMIDOR, LOJISTA
-- =========================================================

-- =========================================================
-- HELPER FUNCTIONS
-- =========================================================

create or replace function public.current_profile_id()
returns uuid
language sql
stable
as $$
  select auth.uid();
$$;

create or replace function public.is_admin()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1
    from public.profiles
    where id = auth.uid()
      and tipo_usuario = 'ADMIN'
      and ativo = true
  );
$$;

create or replace function public.current_consumidor_id()
returns uuid
language sql
stable
security definer
set search_path = public
as $$
  select id
  from public.consumidores
  where profile_id = auth.uid()
  limit 1;
$$;

create or replace function public.current_lojista_id()
returns uuid
language sql
stable
security definer
set search_path = public
as $$
  select id
  from public.lojistas
  where profile_id = auth.uid()
  limit 1;
$$;

create or replace function public.is_lojista_aprovado()
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1
    from public.lojistas
    where profile_id = auth.uid()
      and status_validacao = 'aprovado'
  );
$$;

create or replace function public.owns_estabelecimento(estabelecimento_uuid uuid)
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1
    from public.estabelecimentos e
    join public.lojistas l on l.id = e.lojista_id
    where e.id = estabelecimento_uuid
      and l.profile_id = auth.uid()
  );
$$;

create or replace function public.owns_produto_estabelecimento(produto_estabelecimento_uuid uuid)
returns boolean
language sql
stable
security definer
set search_path = public
as $$
  select exists (
    select 1
    from public.produtos_estabelecimento pe
    join public.estabelecimentos e on e.id = pe.estabelecimento_id
    join public.lojistas l on l.id = e.lojista_id
    where pe.id = produto_estabelecimento_uuid
      and l.profile_id = auth.uid()
  );
$$;

-- =========================================================
-- ENABLE RLS
-- =========================================================

alter table public.profiles enable row level security;
alter table public.consumidores enable row level security;
alter table public.lojistas enable row level security;
alter table public.documentos_lojista enable row level security;
alter table public.estabelecimentos enable row level security;
alter table public.categorias enable row level security;
alter table public.produtos_mestre enable row level security;
alter table public.produtos_estabelecimento enable row level security;
alter table public.precos enable row level security;
alter table public.historico_precos enable row level security;
alter table public.promocoes enable row level security;
alter table public.listas_compras enable row level security;
alter table public.itens_lista enable row level security;
alter table public.comparativos enable row level security;
alter table public.vouchers enable row level security;
alter table public.vouchers_utilizados enable row level security;
alter table public.ofertas_pagas enable row level security;
alter table public.pedidos enable row level security;
alter table public.pagamentos enable row level security;
alter table public.avaliacoes enable row level security;
alter table public.assinaturas enable row level security;
alter table public.notificacoes enable row level security;
alter table public.eventos_analytics enable row level security;
alter table public.integracoes_api enable row level security;
alter table public.favoritos enable row level security;
alter table public.economias_usuario enable row level security;

-- =========================================================
-- PROFILES / CONSUMIDORES / LOJISTAS
-- =========================================================

create policy "profiles_select_own_or_admin" on public.profiles for select using (id = auth.uid() or public.is_admin());
create policy "profiles_insert_own" on public.profiles for insert with check (id = auth.uid() and tipo_usuario in ('CONSUMIDOR','LOJISTA'));
create policy "profiles_update_admin" on public.profiles for update using (public.is_admin()) with check (public.is_admin());

create policy "consumidores_select_own_or_admin" on public.consumidores for select using (profile_id = auth.uid() or public.is_admin());
create policy "consumidores_insert_own" on public.consumidores for insert with check (profile_id = auth.uid());
create policy "consumidores_update_own_or_admin" on public.consumidores for update using (profile_id = auth.uid() or public.is_admin()) with check (profile_id = auth.uid() or public.is_admin());

create policy "lojistas_select_own_or_admin" on public.lojistas for select using (profile_id = auth.uid() or public.is_admin());
create policy "lojistas_insert_own" on public.lojistas for insert with check (profile_id = auth.uid());
create policy "lojistas_update_own_or_admin" on public.lojistas for update using (profile_id = auth.uid() or public.is_admin()) with check (profile_id = auth.uid() or public.is_admin());

-- =========================================================
-- DOCUMENTOS / ESTABELECIMENTOS
-- =========================================================

create policy "documentos_select_owner_or_admin" on public.documentos_lojista for select using (
  public.is_admin() or exists (select 1 from public.lojistas l where l.id = documentos_lojista.lojista_id and l.profile_id = auth.uid())
);
create policy "documentos_insert_owner" on public.documentos_lojista for insert with check (
  exists (select 1 from public.lojistas l where l.id = documentos_lojista.lojista_id and l.profile_id = auth.uid())
);
create policy "documentos_update_owner_or_admin" on public.documentos_lojista for update using (
  public.is_admin() or exists (select 1 from public.lojistas l where l.id = documentos_lojista.lojista_id and l.profile_id = auth.uid())
) with check (
  public.is_admin() or exists (select 1 from public.lojistas l where l.id = documentos_lojista.lojista_id and l.profile_id = auth.uid())
);

create policy "estabelecimentos_read_public_owner_admin" on public.estabelecimentos for select using (ativo = true or public.is_admin() or public.owns_estabelecimento(id));
create policy "estabelecimentos_insert_approved_owner" on public.estabelecimentos for insert with check (public.is_lojista_aprovado() and lojista_id = public.current_lojista_id());
create policy "estabelecimentos_update_owner_or_admin" on public.estabelecimentos for update using (public.owns_estabelecimento(id) or public.is_admin()) with check (public.owns_estabelecimento(id) or public.is_admin());

-- =========================================================
-- CATEGORIAS / PRODUTOS / PREÇOS / PROMOÇÕES
-- =========================================================

create policy "categorias_public_read" on public.categorias for select using (ativo = true or public.is_admin());
create policy "categorias_admin_all" on public.categorias for all using (public.is_admin()) with check (public.is_admin());

create policy "produtos_mestre_public_read" on public.produtos_mestre for select using (ativo = true or public.is_admin());
create policy "produtos_mestre_insert_authenticated" on public.produtos_mestre for insert with check (auth.uid() is not null);
create policy "produtos_mestre_update_admin" on public.produtos_mestre for update using (public.is_admin()) with check (public.is_admin());

create policy "produtos_estabelecimento_read_public_owner_admin" on public.produtos_estabelecimento for select using (ativo = true or public.is_admin() or public.owns_estabelecimento(estabelecimento_id));
create policy "produtos_estabelecimento_insert_owner" on public.produtos_estabelecimento for insert with check (public.is_lojista_aprovado() and public.owns_estabelecimento(estabelecimento_id));
create policy "produtos_estabelecimento_update_owner_or_admin" on public.produtos_estabelecimento for update using (public.owns_estabelecimento(estabelecimento_id) or public.is_admin()) with check (public.owns_estabelecimento(estabelecimento_id) or public.is_admin());

create policy "precos_public_read" on public.precos for select using (true);
create policy "precos_insert_owner_or_admin" on public.precos for insert with check (public.owns_produto_estabelecimento(produto_estabelecimento_id) or public.is_admin());
create policy "precos_update_owner_or_admin" on public.precos for update using (public.owns_produto_estabelecimento(produto_estabelecimento_id) or public.is_admin()) with check (public.owns_produto_estabelecimento(produto_estabelecimento_id) or public.is_admin());

create policy "historico_precos_select_owner_or_admin" on public.historico_precos for select using (public.owns_produto_estabelecimento(produto_estabelecimento_id) or public.is_admin());
create policy "historico_precos_insert_owner_or_admin" on public.historico_precos for insert with check (public.owns_produto_estabelecimento(produto_estabelecimento_id) or public.is_admin());

create policy "promocoes_read_public_owner_admin" on public.promocoes for select using (ativo = true or public.is_admin() or public.owns_produto_estabelecimento(produto_estabelecimento_id));
create policy "promocoes_insert_owner" on public.promocoes for insert with check (public.is_lojista_aprovado() and public.owns_produto_estabelecimento(produto_estabelecimento_id));
create policy "promocoes_update_owner_or_admin" on public.promocoes for update using (public.owns_produto_estabelecimento(produto_estabelecimento_id) or public.is_admin()) with check (public.owns_produto_estabelecimento(produto_estabelecimento_id) or public.is_admin());

-- =========================================================
-- CONSUMIDOR: LISTAS / COMPARATIVOS / FAVORITOS / ECONOMIAS
-- =========================================================

create policy "listas_select_own_or_admin" on public.listas_compras for select using (consumidor_id = public.current_consumidor_id() or public.is_admin());
create policy "listas_insert_own" on public.listas_compras for insert with check (consumidor_id = public.current_consumidor_id());
create policy "listas_update_own_or_admin" on public.listas_compras for update using (consumidor_id = public.current_consumidor_id() or public.is_admin()) with check (consumidor_id = public.current_consumidor_id() or public.is_admin());

create policy "itens_lista_select_own_or_admin" on public.itens_lista for select using (
  public.is_admin() or exists (select 1 from public.listas_compras lc where lc.id = itens_lista.lista_id and lc.consumidor_id = public.current_consumidor_id())
);
create policy "itens_lista_insert_own" on public.itens_lista for insert with check (
  exists (select 1 from public.listas_compras lc where lc.id = itens_lista.lista_id and lc.consumidor_id = public.current_consumidor_id())
);
create policy "itens_lista_update_own_or_admin" on public.itens_lista for update using (
  public.is_admin() or exists (select 1 from public.listas_compras lc where lc.id = itens_lista.lista_id and lc.consumidor_id = public.current_consumidor_id())
) with check (
  public.is_admin() or exists (select 1 from public.listas_compras lc where lc.id = itens_lista.lista_id and lc.consumidor_id = public.current_consumidor_id())
);

create policy "comparativos_select_own_or_admin" on public.comparativos for select using (consumidor_id = public.current_consumidor_id() or public.is_admin());
create policy "comparativos_insert_own" on public.comparativos for insert with check (consumidor_id = public.current_consumidor_id());

create policy "favoritos_select_own_or_admin" on public.favoritos for select using (consumidor_id = public.current_consumidor_id() or public.is_admin());
create policy "favoritos_insert_own" on public.favoritos for insert with check (consumidor_id = public.current_consumidor_id());
create policy "favoritos_update_own_or_admin" on public.favoritos for update using (consumidor_id = public.current_consumidor_id() or public.is_admin()) with check (consumidor_id = public.current_consumidor_id() or public.is_admin());
create policy "favoritos_delete_own_or_admin" on public.favoritos for delete using (consumidor_id = public.current_consumidor_id() or public.is_admin());

create policy "economias_select_own_or_admin" on public.economias_usuario for select using (consumidor_id = public.current_consumidor_id() or public.is_admin());
create policy "economias_insert_own_or_admin" on public.economias_usuario for insert with check (consumidor_id = public.current_consumidor_id() or public.is_admin());

-- =========================================================
-- VOUCHERS
-- =========================================================

create policy "vouchers_read_public_owner_admin" on public.vouchers for select using (ativo = true or public.is_admin() or public.owns_estabelecimento(estabelecimento_id));
create policy "vouchers_insert_owner_premium" on public.vouchers for insert with check (
  public.owns_estabelecimento(estabelecimento_id)
  and exists (select 1 from public.lojistas l where l.id = public.current_lojista_id() and l.premium_ativo = true and l.status_validacao = 'aprovado')
);
create policy "vouchers_update_owner_or_admin" on public.vouchers for update using (public.owns_estabelecimento(estabelecimento_id) or public.is_admin()) with check (public.owns_estabelecimento(estabelecimento_id) or public.is_admin());

create policy "vouchers_utilizados_select_own_or_admin" on public.vouchers_utilizados for select using (consumidor_id = public.current_consumidor_id() or public.is_admin());
create policy "vouchers_utilizados_insert_own" on public.vouchers_utilizados for insert with check (consumidor_id = public.current_consumidor_id());
create policy "vouchers_utilizados_update_own_or_admin" on public.vouchers_utilizados for update using (consumidor_id = public.current_consumidor_id() or public.is_admin()) with check (consumidor_id = public.current_consumidor_id() or public.is_admin());

-- =========================================================
-- OFERTAS / PEDIDOS / PAGAMENTOS
-- =========================================================

create policy "ofertas_pagas_read_public_owner_admin" on public.ofertas_pagas for select using (ativo = true or public.is_admin() or public.owns_estabelecimento(estabelecimento_id));
create policy "ofertas_pagas_insert_owner" on public.ofertas_pagas for insert with check (public.is_lojista_aprovado() and public.owns_estabelecimento(estabelecimento_id));
create policy "ofertas_pagas_update_owner_or_admin" on public.ofertas_pagas for update using (public.owns_estabelecimento(estabelecimento_id) or public.is_admin()) with check (public.owns_estabelecimento(estabelecimento_id) or public.is_admin());

create policy "pedidos_select_related_or_admin" on public.pedidos for select using (consumidor_id = public.current_consumidor_id() or public.owns_estabelecimento(estabelecimento_id) or public.is_admin());
create policy "pedidos_insert_consumer" on public.pedidos for insert with check (consumidor_id = public.current_consumidor_id());
create policy "pedidos_update_merchant_or_admin" on public.pedidos for update using (public.owns_estabelecimento(estabelecimento_id) or public.is_admin()) with check (public.owns_estabelecimento(estabelecimento_id) or public.is_admin());

create policy "pagamentos_select_related_or_admin" on public.pagamentos for select using (
  public.is_admin()
  or exists (select 1 from public.pedidos p where p.id = pagamentos.pedido_id and (p.consumidor_id = public.current_consumidor_id() or public.owns_estabelecimento(p.estabelecimento_id)))
);
create policy "pagamentos_insert_related_consumer" on public.pagamentos for insert with check (
  exists (select 1 from public.pedidos p where p.id = pagamentos.pedido_id and p.consumidor_id = public.current_consumidor_id())
);

-- =========================================================
-- AVALIAÇÕES / ASSINATURAS / NOTIFICAÇÕES / ANALYTICS / INTEGRAÇÕES
-- =========================================================

create policy "avaliacoes_public_read" on public.avaliacoes for select using (true);
create policy "avaliacoes_insert_own" on public.avaliacoes for insert with check (consumidor_id = public.current_consumidor_id());
create policy "avaliacoes_update_own_or_admin" on public.avaliacoes for update using (consumidor_id = public.current_consumidor_id() or public.is_admin()) with check (consumidor_id = public.current_consumidor_id() or public.is_admin());

create policy "assinaturas_select_own_or_admin" on public.assinaturas for select using (profile_id = auth.uid() or public.is_admin());
create policy "assinaturas_insert_own" on public.assinaturas for insert with check (profile_id = auth.uid());
create policy "assinaturas_update_admin" on public.assinaturas for update using (public.is_admin()) with check (public.is_admin());

create policy "notificacoes_select_own_or_admin" on public.notificacoes for select using (usuario_id = auth.uid() or public.is_admin());
create policy "notificacoes_insert_admin" on public.notificacoes for insert with check (public.is_admin());
create policy "notificacoes_update_own_or_admin" on public.notificacoes for update using (usuario_id = auth.uid() or public.is_admin()) with check (usuario_id = auth.uid() or public.is_admin());

create policy "eventos_analytics_insert_authenticated" on public.eventos_analytics for insert with check (auth.uid() is not null);
create policy "eventos_analytics_select_own_or_admin" on public.eventos_analytics for select using (usuario_id = auth.uid() or public.is_admin());

create policy "integracoes_select_owner_or_admin" on public.integracoes_api for select using (public.owns_estabelecimento(estabelecimento_id) or public.is_admin());
create policy "integracoes_insert_owner_or_admin" on public.integracoes_api for insert with check (public.owns_estabelecimento(estabelecimento_id) or public.is_admin());
create policy "integracoes_update_owner_or_admin" on public.integracoes_api for update using (public.owns_estabelecimento(estabelecimento_id) or public.is_admin()) with check (public.owns_estabelecimento(estabelecimento_id) or public.is_admin());

-- =========================================================
-- END
-- =========================================================
