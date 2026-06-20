-- =========================================================
-- ShopXpert - 001_initial_schema.sql
-- Supabase / PostgreSQL
-- Versão: 1.0
-- =========================================================

create extension if not exists "pgcrypto";

do $$ begin create type user_role as enum ('CONSUMIDOR','LOJISTA','ADMIN'); exception when duplicate_object then null; end $$;
do $$ begin create type validation_status as enum ('pendente','em_analise','aprovado','recusado'); exception when duplicate_object then null; end $$;
do $$ begin create type document_type as enum ('RG','CNPJ','COMPROVANTE_RESIDENCIA','RG_SOCIO','COMPROVANTE_SOCIO'); exception when duplicate_object then null; end $$;
do $$ begin create type document_status as enum ('pendente','em_analise','aprovado','recusado'); exception when duplicate_object then null; end $$;
do $$ begin create type voucher_usage_status as enum ('ativo','utilizado','expirado'); exception when duplicate_object then null; end $$;
do $$ begin create type order_status as enum ('aguardando_retirada','retirado','cancelado','expirado'); exception when duplicate_object then null; end $$;
do $$ begin create type payment_status as enum ('pendente','aprovado','recusado','estornado'); exception when duplicate_object then null; end $$;
do $$ begin create type plan_type as enum ('gratuito','premium'); exception when duplicate_object then null; end $$;
do $$ begin create type subscription_status as enum ('ativa','cancelada','expirada','pendente'); exception when duplicate_object then null; end $$;
do $$ begin create type favorite_type as enum ('produto','estabelecimento','promocao'); exception when duplicate_object then null; end $$;
do $$ begin create type savings_origin as enum ('comparativo','voucher','oferta_paga','promocao'); exception when duplicate_object then null; end $$;
do $$ begin create type price_change_origin as enum ('manual_lojista','api','admin','importacao'); exception when duplicate_object then null; end $$;

create or replace function public.set_updated_at()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language plpgsql;

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  nome text not null,
  email text unique,
  telefone text,
  avatar_url text,
  tipo_usuario user_role not null,
  ativo boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.consumidores (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid not null unique references public.profiles(id) on delete cascade,
  cpf text unique,
  premium_ativo boolean not null default false,
  data_inicio_premium timestamptz,
  data_fim_premium timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.lojistas (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid not null unique references public.profiles(id) on delete cascade,
  nome_responsavel text not null,
  cnpj text not null unique,
  status_validacao validation_status not null default 'pendente',
  premium_ativo boolean not null default false,
  data_inicio_premium timestamptz,
  data_fim_premium timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.documentos_lojista (
  id uuid primary key default gen_random_uuid(),
  lojista_id uuid not null references public.lojistas(id) on delete cascade,
  tipo_documento document_type not null,
  arquivo_url text not null,
  status document_status not null default 'pendente',
  observacao_admin text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.estabelecimentos (
  id uuid primary key default gen_random_uuid(),
  lojista_id uuid not null references public.lojistas(id) on delete cascade,
  nome text not null,
  descricao text,
  endereco text not null,
  numero text,
  bairro text,
  cidade text not null,
  estado text not null,
  cep text,
  latitude numeric(10,7),
  longitude numeric(10,7),
  telefone text,
  horario_funcionamento text,
  logo_url text,
  ativo boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.categorias (
  id uuid primary key default gen_random_uuid(),
  nome text not null unique,
  ativo boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.produtos_mestre (
  id uuid primary key default gen_random_uuid(),
  categoria_id uuid references public.categorias(id) on delete set null,
  nome text not null,
  marca text,
  codigo_barras text unique,
  descricao text,
  imagem_url text,
  ativo boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.produtos_estabelecimento (
  id uuid primary key default gen_random_uuid(),
  produto_mestre_id uuid not null references public.produtos_mestre(id) on delete cascade,
  estabelecimento_id uuid not null references public.estabelecimentos(id) on delete cascade,
  sku_interno text,
  disponivel boolean not null default true,
  ativo boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint produtos_estabelecimento_unique unique (produto_mestre_id, estabelecimento_id)
);

create table if not exists public.precos (
  id uuid primary key default gen_random_uuid(),
  produto_estabelecimento_id uuid not null references public.produtos_estabelecimento(id) on delete cascade,
  preco numeric(12,2) not null check (preco >= 0),
  data_atualizacao timestamptz not null default now(),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.historico_precos (
  id uuid primary key default gen_random_uuid(),
  produto_estabelecimento_id uuid not null references public.produtos_estabelecimento(id) on delete cascade,
  preco_anterior numeric(12,2) check (preco_anterior >= 0),
  preco_novo numeric(12,2) not null check (preco_novo >= 0),
  alterado_por uuid references public.profiles(id) on delete set null,
  origem_alteracao price_change_origin not null default 'manual_lojista',
  created_at timestamptz not null default now()
);

create table if not exists public.promocoes (
  id uuid primary key default gen_random_uuid(),
  produto_estabelecimento_id uuid not null references public.produtos_estabelecimento(id) on delete cascade,
  titulo text not null,
  descricao text,
  preco_promocional numeric(12,2) not null check (preco_promocional >= 0),
  validade_inicio timestamptz not null,
  validade_fim timestamptz not null,
  imagem_url text,
  ativo boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint promocoes_validade_check check (validade_fim >= validade_inicio)
);

create table if not exists public.listas_compras (
  id uuid primary key default gen_random_uuid(),
  consumidor_id uuid not null references public.consumidores(id) on delete cascade,
  nome text not null,
  total_estimado numeric(12,2) default 0 check (total_estimado >= 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.itens_lista (
  id uuid primary key default gen_random_uuid(),
  lista_id uuid not null references public.listas_compras(id) on delete cascade,
  produto_nome text not null,
  quantidade numeric(12,3) not null default 1 check (quantidade > 0),
  unidade text default 'unidade',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.comparativos (
  id uuid primary key default gen_random_uuid(),
  consumidor_id uuid not null references public.consumidores(id) on delete cascade,
  lista_id uuid references public.listas_compras(id) on delete set null,
  menor_valor numeric(12,2) check (menor_valor >= 0),
  estabelecimento_vencedor uuid references public.estabelecimentos(id) on delete set null,
  economia_total numeric(12,2) default 0 check (economia_total >= 0),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.vouchers (
  id uuid primary key default gen_random_uuid(),
  estabelecimento_id uuid not null references public.estabelecimentos(id) on delete cascade,
  produto_estabelecimento_id uuid references public.produtos_estabelecimento(id) on delete set null,
  titulo text not null,
  descricao text,
  desconto numeric(12,2) not null check (desconto >= 0),
  quantidade_disponivel integer not null default 0 check (quantidade_disponivel >= 0),
  validade timestamptz not null,
  ativo boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.vouchers_utilizados (
  id uuid primary key default gen_random_uuid(),
  voucher_id uuid not null references public.vouchers(id) on delete cascade,
  consumidor_id uuid not null references public.consumidores(id) on delete cascade,
  data_utilizacao timestamptz,
  status voucher_usage_status not null default 'ativo',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint voucher_consumidor_unique unique (voucher_id, consumidor_id)
);

create table if not exists public.ofertas_pagas (
  id uuid primary key default gen_random_uuid(),
  estabelecimento_id uuid not null references public.estabelecimentos(id) on delete cascade,
  produto_estabelecimento_id uuid not null references public.produtos_estabelecimento(id) on delete cascade,
  preco_original numeric(12,2) not null check (preco_original >= 0),
  preco_desconto numeric(12,2) not null check (preco_desconto >= 0),
  quantidade_disponivel integer not null default 0 check (quantidade_disponivel >= 0),
  validade timestamptz not null,
  ativo boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint oferta_preco_check check (preco_desconto <= preco_original)
);

create table if not exists public.pedidos (
  id uuid primary key default gen_random_uuid(),
  consumidor_id uuid not null references public.consumidores(id) on delete cascade,
  oferta_paga_id uuid not null references public.ofertas_pagas(id) on delete restrict,
  estabelecimento_id uuid not null references public.estabelecimentos(id) on delete restrict,
  codigo_retirada text not null unique,
  valor_pago numeric(12,2) not null check (valor_pago >= 0),
  status order_status not null default 'aguardando_retirada',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.pagamentos (
  id uuid primary key default gen_random_uuid(),
  pedido_id uuid not null unique references public.pedidos(id) on delete cascade,
  gateway text not null,
  transaction_id text,
  valor numeric(12,2) not null check (valor >= 0),
  status payment_status not null default 'pendente',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.avaliacoes (
  id uuid primary key default gen_random_uuid(),
  consumidor_id uuid not null references public.consumidores(id) on delete cascade,
  estabelecimento_id uuid not null references public.estabelecimentos(id) on delete cascade,
  nota integer not null check (nota between 1 and 5),
  comentario text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint avaliacao_consumidor_estabelecimento_unique unique (consumidor_id, estabelecimento_id)
);

create table if not exists public.assinaturas (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid not null references public.profiles(id) on delete cascade,
  tipo_plano plan_type not null default 'gratuito',
  status subscription_status not null default 'pendente',
  inicio timestamptz,
  fim timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.notificacoes (
  id uuid primary key default gen_random_uuid(),
  usuario_id uuid not null references public.profiles(id) on delete cascade,
  titulo text not null,
  mensagem text not null,
  lida boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.eventos_analytics (
  id uuid primary key default gen_random_uuid(),
  usuario_id uuid references public.profiles(id) on delete set null,
  evento text not null,
  origem text,
  created_at timestamptz not null default now()
);

create table if not exists public.integracoes_api (
  id uuid primary key default gen_random_uuid(),
  estabelecimento_id uuid not null references public.estabelecimentos(id) on delete cascade,
  api_key text not null unique,
  sistema_origem text,
  ativo boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.favoritos (
  id uuid primary key default gen_random_uuid(),
  consumidor_id uuid not null references public.consumidores(id) on delete cascade,
  produto_mestre_id uuid references public.produtos_mestre(id) on delete cascade,
  estabelecimento_id uuid references public.estabelecimentos(id) on delete cascade,
  promocao_id uuid references public.promocoes(id) on delete cascade,
  tipo_favorito favorite_type not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint favoritos_alvo_check check (
    (tipo_favorito = 'produto' and produto_mestre_id is not null and estabelecimento_id is null and promocao_id is null)
    or
    (tipo_favorito = 'estabelecimento' and estabelecimento_id is not null and produto_mestre_id is null and promocao_id is null)
    or
    (tipo_favorito = 'promocao' and promocao_id is not null and produto_mestre_id is null and estabelecimento_id is null)
  )
);

create table if not exists public.economias_usuario (
  id uuid primary key default gen_random_uuid(),
  consumidor_id uuid not null references public.consumidores(id) on delete cascade,
  lista_id uuid references public.listas_compras(id) on delete set null,
  pedido_id uuid references public.pedidos(id) on delete set null,
  voucher_id uuid references public.vouchers(id) on delete set null,
  valor_estimado_sem_shopxpert numeric(12,2) check (valor_estimado_sem_shopxpert >= 0),
  valor_pago_ou_estimado numeric(12,2) check (valor_pago_ou_estimado >= 0),
  economia_gerada numeric(12,2) not null default 0 check (economia_gerada >= 0),
  origem savings_origin not null,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- UPDATED_AT TRIGGERS
do $$
declare
  tbl text;
begin
  foreach tbl in array array[
    'profiles','consumidores','lojistas','documentos_lojista','estabelecimentos','categorias',
    'produtos_mestre','produtos_estabelecimento','precos','promocoes','listas_compras',
    'itens_lista','comparativos','vouchers','vouchers_utilizados','ofertas_pagas','pedidos',
    'pagamentos','avaliacoes','assinaturas','notificacoes','integracoes_api','favoritos','economias_usuario'
  ]
  loop
    execute format('drop trigger if exists set_%I_updated_at on public.%I;', tbl, tbl);
    execute format('create trigger set_%I_updated_at before update on public.%I for each row execute function public.set_updated_at();', tbl, tbl);
  end loop;
end $$;

-- INDEXES
create index if not exists idx_profiles_email on public.profiles(email);
create index if not exists idx_profiles_tipo_usuario on public.profiles(tipo_usuario);
create index if not exists idx_consumidores_profile_id on public.consumidores(profile_id);
create index if not exists idx_consumidores_cpf on public.consumidores(cpf);
create index if not exists idx_lojistas_profile_id on public.lojistas(profile_id);
create index if not exists idx_lojistas_cnpj on public.lojistas(cnpj);
create index if not exists idx_lojistas_status_validacao on public.lojistas(status_validacao);
create index if not exists idx_documentos_lojista_lojista_id on public.documentos_lojista(lojista_id);
create index if not exists idx_estabelecimentos_lojista_id on public.estabelecimentos(lojista_id);
create index if not exists idx_estabelecimentos_cidade_estado on public.estabelecimentos(cidade, estado);
create index if not exists idx_produtos_mestre_categoria_id on public.produtos_mestre(categoria_id);
create index if not exists idx_produtos_mestre_codigo_barras on public.produtos_mestre(codigo_barras);
create index if not exists idx_produtos_mestre_nome on public.produtos_mestre(nome);
create index if not exists idx_produtos_estabelecimento_produto_mestre_id on public.produtos_estabelecimento(produto_mestre_id);
create index if not exists idx_produtos_estabelecimento_estabelecimento_id on public.produtos_estabelecimento(estabelecimento_id);
create index if not exists idx_precos_produto_estabelecimento_id on public.precos(produto_estabelecimento_id);
create index if not exists idx_precos_data_atualizacao on public.precos(data_atualizacao desc);
create index if not exists idx_historico_precos_produto_estabelecimento_id on public.historico_precos(produto_estabelecimento_id);
create index if not exists idx_promocoes_produto_estabelecimento_id on public.promocoes(produto_estabelecimento_id);
create index if not exists idx_promocoes_validade on public.promocoes(validade_inicio, validade_fim);
create index if not exists idx_listas_compras_consumidor_id on public.listas_compras(consumidor_id);
create index if not exists idx_itens_lista_lista_id on public.itens_lista(lista_id);
create index if not exists idx_comparativos_consumidor_id on public.comparativos(consumidor_id);
create index if not exists idx_vouchers_estabelecimento_id on public.vouchers(estabelecimento_id);
create index if not exists idx_vouchers_produto_estabelecimento_id on public.vouchers(produto_estabelecimento_id);
create index if not exists idx_vouchers_utilizados_consumidor_id on public.vouchers_utilizados(consumidor_id);
create index if not exists idx_ofertas_pagas_estabelecimento_id on public.ofertas_pagas(estabelecimento_id);
create index if not exists idx_ofertas_pagas_produto_estabelecimento_id on public.ofertas_pagas(produto_estabelecimento_id);
create index if not exists idx_pedidos_consumidor_id on public.pedidos(consumidor_id);
create index if not exists idx_pedidos_estabelecimento_id on public.pedidos(estabelecimento_id);
create index if not exists idx_pedidos_status on public.pedidos(status);
create index if not exists idx_pagamentos_pedido_id on public.pagamentos(pedido_id);
create index if not exists idx_avaliacoes_consumidor_id on public.avaliacoes(consumidor_id);
create index if not exists idx_avaliacoes_estabelecimento_id on public.avaliacoes(estabelecimento_id);
create index if not exists idx_assinaturas_profile_id on public.assinaturas(profile_id);
create index if not exists idx_notificacoes_usuario_id on public.notificacoes(usuario_id);
create index if not exists idx_eventos_analytics_usuario_id on public.eventos_analytics(usuario_id);
create index if not exists idx_eventos_analytics_evento on public.eventos_analytics(evento);
create index if not exists idx_integracoes_api_estabelecimento_id on public.integracoes_api(estabelecimento_id);
create index if not exists idx_favoritos_consumidor_id on public.favoritos(consumidor_id);
create index if not exists idx_economias_usuario_consumidor_id on public.economias_usuario(consumidor_id);

-- SEED CATEGORIAS
insert into public.categorias (nome) values
('Mercearia'),
('Limpeza'),
('Higiene'),
('Bebidas'),
('Hortifruti'),
('Carnes'),
('Laticínios'),
('Padaria')
on conflict (nome) do nothing;
