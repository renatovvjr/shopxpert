# Visão Geral da Arquitetura - ShopXpert

## Objetivo

Construir uma plataforma escalável com três experiências principais:

1. App mobile para consumidores.
2. Portal web para lojistas.
3. Painel web administrativo.

## Decisão Arquitetural

Será usado um monorepo com separação por aplicações e pacotes compartilhados.

## Módulos

- `apps/mobile`: aplicativo consumidor.
- `apps/web-lojista`: portal do lojista.
- `apps/web-admin`: painel administrativo.
- `packages/ui`: componentes compartilhados.
- `packages/types`: tipos TypeScript globais.
- `packages/services`: serviços compartilhados.
- `packages/utils`: utilitários.
- `packages/constants`: constantes visuais e regras.
- `supabase`: banco, functions, migrations, seed e storage.
