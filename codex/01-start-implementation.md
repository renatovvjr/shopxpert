# Codex - Etapa 1: Fundação do Projeto ShopXpert

Leia obrigatoriamente:

- README.md
- AGENTS.md
- architecture/
- supabase/migrations/
- prompts/

Objetivo desta etapa:

Criar a fundação técnica do monorepo ShopXpert, sem implementar telas completas ainda.

## Stack obrigatória

- Next.js + TypeScript para web
- Expo + React Native + TypeScript para mobile
- Supabase para backend
- PostgreSQL já criado
- RLS já aplicado

## Estrutura esperada

Criar/configurar:

- apps/web
- apps/mobile
- packages/ui
- packages/types
- packages/services
- packages/utils
- packages/constants

## Entregas obrigatórias

1. package.json raiz
2. configuração de workspaces
3. tsconfig base
4. eslint
5. prettier
6. Supabase client compartilhado
7. tipos base do banco
8. constantes da marca
9. estrutura inicial dos apps
10. README atualizado com comandos

## Regras

- Não alterar migrations existentes
- Não criar novo banco
- Não criar tabelas novas
- Não remover documentação
- Não implementar todas as telas ainda
- Não usar Firebase
- Não usar MongoDB
- Não criar ORM
- Usar TypeScript estrito

## Resultado esperado

Ao final, o projeto deve permitir instalar dependências e rodar a base inicial dos apps.