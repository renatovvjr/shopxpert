# AGENTS.md - ShopXpert

Você está trabalhando no projeto ShopXpert.

## Objetivo

Construir uma plataforma web/mobile para comparação de preços, listas inteligentes de compras, promoções, vouchers, ofertas pagas, planos premium, gestão de lojistas e painel administrativo.

## Estrutura do projeto

- apps/mobile: aplicativo mobile consumidor.
- apps/web-lojista: portal web do lojista.
- apps/web-admin: painel administrativo.
- packages/ui: componentes compartilhados.
- packages/types: tipos TypeScript compartilhados.
- packages/services: serviços compartilhados.
- packages/utils: utilitários.
- packages/constants: constantes globais.
- supabase: migrations, schema, functions, seed e storage.
- docs: documentação do produto.
- architecture: arquitetura técnica.
- prompts: prompts de geração.

## Stack desejada

- Mobile: React Native + Expo + TypeScript.
- Web: Next.js + TypeScript + Tailwind CSS.
- Backend: Supabase.
- Banco: PostgreSQL.
- Auth: Supabase Auth.

## Regras de design

- Laranja principal: #F25022.
- Verde principal: #007E33.
- Fundo principal: #FFFFFF.
- Fundo de inputs/cards: #FAFAFA.
- Texto principal: #333333.
- Texto secundário: #666666.
- Placeholder: #999999.
- Borda: #CCCCCC.
- Botões principais com altura de 50px e raio de 10px.

## Regras importantes

- Não remover arquivos da pasta docs.
- Não remover assets da marca.
- Não criar código sem respeitar os wireframes, mockups e UX Flow.
- Não misturar regras de consumidor, lojista e admin.
- Usar TypeScript.
- Criar componentes reutilizáveis.
- Preparar integração Supabase, mas não expor secrets.
- Usar variáveis de ambiente.