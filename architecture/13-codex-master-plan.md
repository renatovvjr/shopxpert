# Codex Master Plan - ShopXpert

## Objetivo

Este documento define a estratégia oficial para utilização do Codex no projeto ShopXpert.

O Codex NÃO deve gerar o sistema inteiro de uma única vez.

O desenvolvimento deverá ser realizado em módulos.

---

# CONTEXTO DO PROJETO

ShopXpert é uma plataforma composta por:

1. Aplicativo Mobile Consumidor
2. Portal Web Lojista
3. Painel Administrativo
4. Backend Supabase

Funcionalidades principais:

* Comparação de preços
* Listas inteligentes
* Promoções
* Vouchers
* Ofertas pagas
* Pedidos com retirada
* Planos premium
* Analytics

---

# STACK OFICIAL

## Mobile

* React Native
* Expo
* TypeScript

## Web

* Next.js
* TypeScript
* Tailwind CSS

## Backend

* Supabase
* PostgreSQL
* Storage
* Auth
* Edge Functions

---

# FONTES DE VERDADE

O Codex deverá sempre consultar:

1. README.md
2. AGENTS.md
3. architecture/*
4. docs/*
5. prompts/*

Nenhuma implementação deve ignorar estes documentos.

---

# ORDEM DE GERAÇÃO

## ETAPA 1

Infraestrutura

Objetivo:

Criar configuração inicial.

Gerar:

* package.json
* tsconfig
* eslint
* prettier
* estrutura de apps

Não gerar telas ainda.

---

## ETAPA 2

Design System

Objetivo:

Criar componentes compartilhados.

Gerar:

* Colors
* Typography
* Buttons
* Inputs
* Cards
* Layout

Baseado na identidade visual:

* #F25022
* #007E33

---

## ETAPA 3

App Mobile Consumidor

Gerar:

* Navegação
* Telas mockadas
* Estados locais
* Dados fake

Telas:

* Seleção de perfil
* Boas-vindas
* Cadastro
* Login
* Home
* Lista de compras
* Comparativo
* Promoções
* Conta
* Premium
* Pedidos

Sem backend.

---

## ETAPA 4

Portal Lojista

Gerar:

* Login
* Cadastro
* Upload documentos
* Dashboard
* Produtos
* Promoções
* Relatórios

Sem backend.

---

## ETAPA 5

Painel Administrativo

Gerar:

* Login
* Dashboard
* Aprovação de lojistas
* Relatórios

Sem backend.

---

## ETAPA 6

Supabase

Gerar:

* migrations
* schema
* seed
* buckets
* policies RLS

Com base em:

* 08-modelo-banco-dados.md
* 11-matriz-de-permissoes.md
* 12-supabase-roadmap.md

---

## ETAPA 7

Integração Backend

Integrar:

* Auth
* Storage
* Banco

---

## ETAPA 8

Monetização

Gerar:

* Premium consumidor
* Premium lojista
* Vouchers
* Ofertas pagas
* Pedidos

---

## ETAPA 9

Analytics

Gerar:

* eventos
* dashboards
* métricas

---

## ETAPA 10

Deploy

Preparar:

* Mobile
* Web
* Supabase

---

# REGRAS IMPORTANTES

O Codex deve:

✅ Criar código modular

✅ Utilizar TypeScript

✅ Criar componentes reutilizáveis

✅ Seguir UX Flow

✅ Seguir Mockups

✅ Seguir Wireframes

✅ Seguir Regras de Negócio

✅ Seguir Matriz de Permissões

---

# O QUE O CODEX NÃO DEVE FAZER

❌ Ignorar documentação

❌ Criar tabelas fora do modelo

❌ Misturar consumidor com lojista

❌ Criar acesso administrativo sem controle

❌ Expor secrets

❌ Hardcode de URLs

❌ Hardcode de credenciais

---

# RESULTADO ESPERADO

Gerar aproximadamente 80% do MVP do ShopXpert com arquitetura escalável, organizada e pronta para evolução.

Fim da versão 1.0
