# 28 - CODEX MASTER PROMPT

## Objetivo

Você é o agente principal responsável por implementar o projeto ShopXpert.

Antes de gerar qualquer código, leia toda a documentação da pasta architecture.

Nenhuma decisão arquitetural deve ser inventada.

Toda implementação deve respeitar os documentos existentes.

---

# Documentos Obrigatórios

Leia obrigatoriamente:

00-visao-geral.md

01-modelo-dominio.md

02-database-model.md

03-permissions.md

04-api-specification.md

05-ux-guidelines.md

06-roadmap-mvp.md

07-decisoes-tecnicas.md

08-modelo-banco-dados.md

09-regras-de-negocio.md

10-user-stories.md

11-matriz-de-permissoes.md

12-supabase-roadmap.md

13-codex-master-plan.md

14-mvp-scope.md

15-future-features.md

16-monetization-model.md

17-kpis-e-metricas.md

18-entity-relationship-model.md

19-supabase-schema-final.md

20-codex-execution-plan.md

21-revisao-final-arquitetura.md

22-schema-consolidado.md

23-governanca-e-perfis.md

24-principios-ux.md

26-cadastro-e-onboarding.md

27-admin-governance.md

---

# Fonte da Verdade

A fonte única da verdade para banco de dados é:

supabase/migrations/

Principalmente:

001_initial_schema.sql

002_rls.sql

003_storage_policies.sql

004_auth_triggers.sql

005_seed_data.sql

006_admin_bootstrap.sql

Nunca criar tabelas divergentes.

Nunca criar colunas inexistentes.

Nunca alterar relacionamentos sem migration.

---

# Stack Obrigatória

Frontend Web:

* Next.js
* TypeScript
* App Router

Mobile:

* React Native
* Expo
* TypeScript

Backend:

* Supabase

Banco:

* PostgreSQL

Autenticação:

* Supabase Auth

Storage:

* Supabase Storage

---

# Perfis do Sistema

CONSUMIDOR

LOJISTA

ADMIN

---

# Regra Fundamental

Todo usuário nasce como:

CONSUMIDOR

Lojista depende de aprovação.

Admin é criado manualmente.

---

# MVP Obrigatório

Implementar primeiro:

1. Cadastro/Login

2. Perfil Consumidor

3. Lista de Compras

4. Comparador de Preços

5. Favoritos

6. Estabelecimentos

7. Produtos

8. Histórico de Preços

9. Promoções

10. Vouchers

11. Perfil Lojista

12. Painel Admin

---

# Regras de Desenvolvimento

Sempre gerar:

* código limpo
* TypeScript estrito
* componentes reutilizáveis
* tipagem completa
* tratamento de erros
* loading states
* empty states
* responsividade

---

# Proibições

Não criar arquitetura paralela.

Não substituir Supabase.

Não criar ORM adicional.

Não usar Firebase.

Não usar MongoDB.

Não alterar o modelo de domínio.

Não alterar tabelas existentes.

Não alterar enums existentes.

---

# Integrações Obrigatórias

Auth → Supabase Auth

Storage → Supabase Storage

Database → PostgreSQL Supabase

Policies → RLS

---

# Ordem de Implementação

Fase 1

Infraestrutura Frontend

* Next.js
* Expo
* Configurações
* Providers
* Supabase Client

Fase 2

Auth

* Login
* Cadastro
* Recuperação de senha

Fase 3

Consumidor

* Dashboard
* Listas
* Comparativos
* Favoritos

Fase 4

Lojista

* Onboarding
* Estabelecimentos
* Produtos
* Promoções

Fase 5

Admin

* Aprovação de lojistas
* Moderação
* Analytics

---

# UX

Seguir obrigatoriamente:

24-principios-ux.md

A aplicação deve ser extremamente simples para usuários não técnicos.

Priorizar:

* clareza
* velocidade
* poucos cliques
* linguagem simples

---

# Critério de Qualidade

Antes de finalizar qualquer feature verificar:

* Tipagem correta
* Sem erros TypeScript
* Sem warnings
* RLS respeitado
* Performance adequada
* Responsividade

---

# Objetivo Final

Construir a plataforma ShopXpert completa respeitando integralmente a arquitetura documentada e o banco de dados existente.

Nenhuma decisão deve contradizer a documentação oficial.
