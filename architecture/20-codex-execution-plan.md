# Codex Execution Plan - ShopXpert

## Objetivo

Definir o roteiro oficial de execução do Codex para geração do projeto ShopXpert.

Este documento deve ser usado como guia operacional para evitar geração desorganizada de código.

---

# PRINCÍPIO CENTRAL

O Codex não deve gerar todo o sistema em uma única execução.

O projeto deve ser construído em etapas pequenas, revisáveis e testáveis.

---

# FONTES DE VERDADE

Antes de gerar código, o Codex deve ler:

- README.md
- AGENTS.md
- docs/
- architecture/
- prompts/

---

# ETAPA 0 - LEITURA DO PROJETO

## Prompt

Leia toda a documentação do projeto ShopXpert, incluindo README.md, AGENTS.md, docs/, architecture/ e prompts/.

Depois disso, gere apenas um resumo técnico do que entendeu, sem criar código ainda.

## Resultado Esperado

- Resumo da arquitetura
- Módulos identificados
- Stack identificada
- Riscos técnicos
- Próximos passos sugeridos

---

# ETAPA 1 - CONFIGURAÇÃO DO MONOREPO

## Prompt

Com base na documentação do ShopXpert, gere apenas a configuração inicial do monorepo.

Crie:

- package.json raiz
- tsconfig base
- eslint
- prettier
- configuração de workspaces
- scripts iniciais
- estrutura mínima dos apps

Não gere telas ainda.

## Resultado Esperado

- Projeto instalável
- Workspaces configurados
- TypeScript configurado
- Padronização inicial

---

# ETAPA 2 - DESIGN SYSTEM

## Prompt

Crie o design system inicial do ShopXpert com base na identidade visual documentada.

Criar em packages/ui:

- Button
- Input
- Card
- Badge
- Header
- BottomNavigation
- Sidebar
- Layout
- Typography

Usar cores:

- #F25022
- #007E33
- #FFFFFF
- #FAFAFA
- #333333
- #666666
- #CCCCCC

## Resultado Esperado

- Componentes reutilizáveis
- Tokens visuais
- Base para mobile e web

---

# ETAPA 3 - MOBILE CONSUMIDOR MOCKADO

## Prompt

Gere as telas do app mobile consumidor usando React Native, Expo e TypeScript.

Usar dados mockados.

Telas:

- Seleção de Perfil
- Boas-vindas
- Cadastro
- Login
- Home
- Lista de Compras
- Comparativo
- Promoções e Cupons
- Conta/Perfil
- Avaliação
- Plano Premium
- Histórico de Vouchers
- Ofertas Pagas
- Pedido Confirmado
- Meus Pedidos

Não integrar Supabase ainda.

## Resultado Esperado

- App mobile navegável
- Telas mockadas
- Navegação funcional
- Visual alinhado ao design system

---

# ETAPA 4 - WEB LOJISTA MOCKADO

## Prompt

Gere o portal web do lojista usando Next.js, TypeScript e Tailwind.

Usar dados mockados.

Telas:

- Boas-vindas Lojista
- Login
- Cadastro Lojista
- Upload de Documentos
- Dashboard
- Produtos
- Promoções
- Relatórios
- Perfil da Loja
- Plano Premium
- Gestão de Vouchers
- Ofertas Pagas
- Pedidos/Retiradas

Não integrar Supabase ainda.

## Resultado Esperado

- Portal lojista navegável
- Sidebar
- Dashboard mockado
- Tabelas e formulários

---

# ETAPA 5 - WEB ADMIN MOCKADO

## Prompt

Gere o painel administrativo usando Next.js, TypeScript e Tailwind.

Usar dados mockados.

Telas:

- Login Admin
- Dashboard Admin
- Lojistas Pendentes
- Validação de Documentos
- Usuários
- Estabelecimentos
- Produtos
- Promoções
- Vouchers
- Ofertas Pagas
- Pedidos
- Relatórios
- Configurações

Não integrar Supabase ainda.

## Resultado Esperado

- Painel admin navegável
- Tabelas administrativas
- Filtros
- Badges de status
- Ações administrativas

---

# ETAPA 6 - SUPABASE SCHEMA

## Prompt

Com base nos documentos:

- 08-modelo-banco-dados.md
- 11-matriz-de-permissoes.md
- 12-supabase-roadmap.md
- 18-entity-relationship-model.md
- 19-supabase-schema-final.md

Gere as migrations SQL completas para o Supabase.

Criar:

- tabelas
- enums
- foreign keys
- indexes
- triggers updated_at
- seed inicial
- storage buckets documentados

Não integrar frontend ainda.

## Resultado Esperado

- SQL organizado
- Migrations versionadas
- Banco pronto para validação

---

# ETAPA 7 - RLS POLICIES

## Prompt

Com base na matriz de permissões, gere as políticas RLS do Supabase.

Perfis:

- CONSUMIDOR
- LOJISTA
- ADMIN

Garantir:

- consumidor acessa apenas seus dados privados
- lojista acessa apenas seus próprios recursos
- admin possui acesso controlado global
- buckets privados protegidos

## Resultado Esperado

- Policies SQL
- Segurança por perfil
- Storage policies

---

# ETAPA 8 - SUPABASE SERVICES

## Prompt

Crie os serviços compartilhados de integração com Supabase.

Gerar em packages/services:

- supabaseClient
- authService
- consumerService
- merchantService
- productService
- promotionService
- voucherService
- orderService
- analyticsService

## Resultado Esperado

- Serviços reutilizáveis
- Tipagem TypeScript
- Preparação para integração real

---

# ETAPA 9 - INTEGRAÇÃO AUTH

## Prompt

Integre autenticação Supabase nos três módulos:

- mobile consumidor
- web lojista
- web admin

Implementar:

- login
- cadastro
- logout
- proteção de rotas
- redirecionamento por perfil

## Resultado Esperado

- Auth funcional
- Sessão persistente
- Roteamento por tipo de usuário

---

# ETAPA 10 - INTEGRAÇÃO MOBILE

## Prompt

Integrar o app mobile consumidor com Supabase.

Conectar:

- perfil
- listas de compras
- produtos
- promoções
- vouchers
- ofertas pagas
- pedidos
- avaliações

## Resultado Esperado

- App consumidor usando dados reais

---

# ETAPA 11 - INTEGRAÇÃO LOJISTA

## Prompt

Integrar portal lojista com Supabase.

Conectar:

- cadastro
- documentos
- estabelecimento
- produtos
- promoções
- vouchers
- ofertas pagas
- pedidos
- relatórios

## Resultado Esperado

- Portal lojista usando dados reais

---

# ETAPA 12 - INTEGRAÇÃO ADMIN

## Prompt

Integrar painel admin com Supabase.

Conectar:

- usuários
- aprovação lojistas
- documentos
- produtos
- promoções
- vouchers
- pedidos
- analytics

## Resultado Esperado

- Admin usando dados reais

---

# ETAPA 13 - MONETIZAÇÃO

## Prompt

Preparar estrutura de monetização.

Implementar base para:

- assinatura consumidor premium
- assinatura lojista premium
- ofertas pagas
- pagamentos
- status de transações

Não integrar gateway real sem decisão final.

## Resultado Esperado

- Fluxo financeiro preparado
- Mock gateway ou camada abstrata

---

# ETAPA 14 - EDGE FUNCTIONS

## Prompt

Criar Edge Functions Supabase para:

- compare-prices
- create-withdraw-code
- validate-voucher
- analytics-event
- subscription-check

## Resultado Esperado

- Functions organizadas
- Código TypeScript
- Preparação para deploy

---

# ETAPA 15 - TESTES E REVISÃO

## Prompt

Revise o projeto ShopXpert.

Verifique:

- TypeScript
- rotas
- componentes
- responsividade
- segurança
- estrutura Supabase
- inconsistências com documentação

Corrija problemas encontrados.

## Resultado Esperado

- Projeto revisado
- Código mais consistente
- Lista de pendências

---

# ORDEM OBRIGATÓRIA

O Codex deve seguir esta ordem:

1. Leitura
2. Monorepo
3. Design System
4. Mobile mockado
5. Lojista mockado
6. Admin mockado
7. Supabase schema
8. RLS
9. Services
10. Auth
11. Integrações
12. Monetização
13. Edge Functions
14. Testes

---

# REGRAS FINAIS

- Não gerar tudo de uma vez.
- Não ignorar documentação.
- Não criar secrets.
- Não criar tabelas fora do schema final.
- Não misturar responsabilidades.
- Não remover arquivos existentes.
- Confirmar cada etapa antes de seguir para a próxima.

---

Fim da versão 1.0