-- =========================================================
-- ShopXpert - 005_seed_data.sql
-- Compatível com schema atual
-- =========================================================

-- =========================================================
-- CATEGORIAS
-- =========================================================

insert into public.categorias (nome, ativo)
values
('Mercearia', true),
('Limpeza', true),
('Higiene', true),
('Bebidas', true),
('Hortifruti', true),
('Carnes', true),
('Laticínios', true),
('Padaria', true),
('Pet Shop', true),
('Farmácia', true)
on conflict (nome) do nothing;

-- =========================================================
-- PRODUTOS MESTRE
-- =========================================================

insert into public.produtos_mestre
(nome, categoria_id, marca, descricao, ativo)
select
'Arroz Tipo 1 5kg',
c.id,
'Genérico',
'Arroz branco tipo 1 embalagem 5kg',
true
from public.categorias c
where c.nome = 'Mercearia';

insert into public.produtos_mestre
(nome, categoria_id, marca, descricao, ativo)
select
'Feijão Carioca 1kg',
c.id,
'Genérico',
'Feijão carioca embalagem 1kg',
true
from public.categorias c
where c.nome = 'Mercearia';

insert into public.produtos_mestre
(nome, categoria_id, marca, descricao, ativo)
select
'Macarrão Espaguete 500g',
c.id,
'Genérico',
'Macarrão espaguete tradicional',
true
from public.categorias c
where c.nome = 'Mercearia';

insert into public.produtos_mestre
(nome, categoria_id, marca, descricao, ativo)
select
'Café Torrado 500g',
c.id,
'Genérico',
'Café torrado e moído',
true
from public.categorias c
where c.nome = 'Mercearia';

insert into public.produtos_mestre
(nome, categoria_id, marca, descricao, ativo)
select
'Leite Integral 1L',
c.id,
'Genérico',
'Leite integral longa vida',
true
from public.categorias c
where c.nome = 'Laticínios';

insert into public.produtos_mestre
(nome, categoria_id, marca, descricao, ativo)
select
'Manteiga 200g',
c.id,
'Genérico',
'Manteiga com sal',
true
from public.categorias c
where c.nome = 'Laticínios';

insert into public.produtos_mestre
(nome, categoria_id, marca, descricao, ativo)
select
'Pão Francês',
c.id,
'Padaria',
'Pão francês vendido por kg',
true
from public.categorias c
where c.nome = 'Padaria';

insert into public.produtos_mestre
(nome, categoria_id, marca, descricao, ativo)
select
'Banana Prata',
c.id,
'Natural',
'Banana prata fresca',
true
from public.categorias c
where c.nome = 'Hortifruti';

insert into public.produtos_mestre
(nome, categoria_id, marca, descricao, ativo)
select
'Tomate',
c.id,
'Natural',
'Tomate fresco',
true
from public.categorias c
where c.nome = 'Hortifruti';

insert into public.produtos_mestre
(nome, categoria_id, marca, descricao, ativo)
select
'Detergente 500ml',
c.id,
'Genérico',
'Detergente líquido 500ml',
true
from public.categorias c
where c.nome = 'Limpeza';

insert into public.produtos_mestre
(nome, categoria_id, marca, descricao, ativo)
select
'Sabão em Pó 1kg',
c.id,
'Genérico',
'Sabão em pó embalagem 1kg',
true
from public.categorias c
where c.nome = 'Limpeza';

insert into public.produtos_mestre
(nome, categoria_id, marca, descricao, ativo)
select
'Papel Higiênico 12 Rolos',
c.id,
'Genérico',
'Pacote com 12 rolos',
true
from public.categorias c
where c.nome = 'Higiene';

insert into public.produtos_mestre
(nome, categoria_id, marca, descricao, ativo)
select
'Sabonete 90g',
c.id,
'Genérico',
'Sabonete corporal',
true
from public.categorias c
where c.nome = 'Higiene';

insert into public.produtos_mestre
(nome, categoria_id, marca, descricao, ativo)
select
'Refrigerante Cola 2L',
c.id,
'Genérico',
'Refrigerante sabor cola',
true
from public.categorias c
where c.nome = 'Bebidas';

insert into public.produtos_mestre
(nome, categoria_id, marca, descricao, ativo)
select
'Água Mineral 500ml',
c.id,
'Genérico',
'Água mineral sem gás',
true
from public.categorias c
where c.nome = 'Bebidas';

insert into public.produtos_mestre
(nome, categoria_id, marca, descricao, ativo)
select
'Ração para Cães 10kg',
c.id,
'Genérico',
'Ração seca para cães adultos',
true
from public.categorias c
where c.nome = 'Pet Shop';

-- =========================================================
-- FIM
-- =========================================================