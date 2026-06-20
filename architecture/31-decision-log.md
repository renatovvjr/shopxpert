# 31 - DECISION LOG

## Objetivo

Registrar todas as decisões arquiteturais relevantes do projeto ShopXpert.

Este documento funciona como histórico oficial das decisões do produto.

Nenhuma decisão importante deve existir apenas em conversas.

Toda mudança arquitetural deve ser registrada aqui.

---

# DECISÃO 001

Data: 2026

Título:

Supabase como Backend Principal

---

Decisão

Utilizar Supabase como plataforma principal de backend.

---

Motivo

* Menor custo operacional
* Auth integrado
* Storage integrado
* PostgreSQL nativo
* Escalabilidade adequada para MVP

---

Impacto

* Banco de Dados
* Auth
* Storage
* APIs

---

Status

APROVADA

---

# DECISÃO 002

Data: 2026

Título:

Monorepo

---

Decisão

Utilizar estrutura monorepo.

---

Motivo

Compartilhamento de código entre:

* Web
* Mobile
* Shared Packages

---

Impacto

* Arquitetura
* Desenvolvimento

---

Status

APROVADA

---

# DECISÃO 003

Data: 2026

Título:

Next.js para Web

---

Decisão

Utilizar Next.js para aplicação web.

---

Motivo

* SEO
* Performance
* Escalabilidade
* Ecossistema

---

Status

APROVADA

---

# DECISÃO 004

Data: 2026

Título:

Expo para Mobile

---

Decisão

Utilizar React Native com Expo.

---

Motivo

* Produtividade
* Atualizações rápidas
* Menor custo

---

Status

APROVADA

---

# DECISÃO 005

Data: 2026

Título:

Todo usuário nasce como consumidor

---

Decisão

Todo cadastro inicia como:

CONSUMIDOR

---

Motivo

Reduzir atrito no onboarding.

---

Impacto

* Auth
* Profiles
* Permissões

---

Status

APROVADA

---

# DECISÃO 006

Data: 2026

Título:

Lojista depende de aprovação

---

Decisão

Nenhum lojista é criado automaticamente.

---

Fluxo

Cadastro

↓

Consumidor

↓

Solicita tornar-se lojista

↓

Admin aprova

↓

Lojista ativo

---

Motivo

* Segurança
* Qualidade da base
* Controle operacional

---

Status

APROVADA

---

# DECISÃO 007

Data: 2026

Título:

Administrador criado manualmente

---

Decisão

Administradores não podem ser criados pela aplicação.

---

Motivo

Segurança.

---

Status

APROVADA

---

# DECISÃO 008

Data: 2026

Título:

Comparador de preços é funcionalidade principal

---

Decisão

Toda arquitetura deve priorizar:

* comparação
* economia
* descoberta de ofertas

---

Motivo

É o principal diferencial competitivo.

---

Status

APROVADA

---

# DECISÃO 009

Data: 2026

Título:

Mobile First

---

Decisão

Priorizar experiência mobile.

---

Motivo

Maior volume esperado de uso.

---

Status

APROVADA

---

# DECISÃO 010

Data: 2026

Título:

Avatares públicos

---

Decisão

Fotos de perfil podem ser visualizadas publicamente.

---

Motivo

Comportamento já conhecido pelos usuários.

---

Status

APROVADA

---

# DECISÃO 011

Data: 2026

Título:

Produtos públicos

---

Decisão

Produtos podem ser visualizados sem login.

---

Motivo

* SEO
* Descoberta
* Compartilhamento

---

Status

APROVADA

---

# DECISÃO 012

Data: 2026

Título:

Documentos de lojistas privados

---

Decisão

Documentação empresarial é privada.

---

Acesso

* Admin
* Proprietário

---

Status

APROVADA

---

# DECISÃO 013

Data: 2026

Título:

Backend congelado antes da implementação

---

Decisão

Concluir arquitetura e banco antes de iniciar geração massiva de código.

---

Motivo

Reduzir retrabalho.

---

Status

APROVADA

---

# REGRAS DE MANUTENÇÃO

Toda nova decisão deve conter:

* Data
* Título
* Decisão
* Motivo
* Impacto
* Status

---

Status possíveis:

* PROPOSTA
* APROVADA
* REJEITADA
* SUBSTITUÍDA

---

# REGRA FINAL

Se uma decisão impactar:

* Banco
* Permissões
* UX
* Segurança
* Monetização

ela deve ser registrada neste documento antes da implementação.

---

Versão 1.0
