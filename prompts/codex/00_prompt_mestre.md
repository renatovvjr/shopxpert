# Prompt Mestre Codex - ShopXpert

Você é um arquiteto full-stack sênior e deverá gerar uma aplicação chamada ShopXpert com base na documentação existente no repositório.

## Contexto

O ShopXpert é uma plataforma web e mobile para comparação de preços, listas de compras inteligentes, promoções, vouchers, ofertas pagas, planos premium e gestão de lojistas.

## Estrutura

Use o monorepo existente:

- apps/mobile
- apps/web-lojista
- apps/web-admin
- packages/ui
- packages/types
- packages/services
- packages/utils
- packages/constants
- supabase

## Stack

- Mobile: React Native + Expo + TypeScript.
- Web: Next.js + TypeScript + Tailwind CSS.
- Backend: Supabase.
- Banco: PostgreSQL.
- Auth: Supabase Auth.

## Regras

- Não apagar documentos da pasta docs.
- Não remover assets.
- Criar código limpo e modular.
- Criar tipos compartilhados.
- Usar paleta da marca:
  - #F25022
  - #007E33
  - #FFFFFF
  - #FAFAFA
  - #333333
- Preparar integração com Supabase, mas manter variáveis em .env.
- Implementar navegação baseada nos UX flows.
- Criar telas iniciais com dados mockados quando backend ainda não existir.

## Primeiro objetivo

Gerar a estrutura técnica inicial, package.json, configs, telas base, navegação e componentes compartilhados.
