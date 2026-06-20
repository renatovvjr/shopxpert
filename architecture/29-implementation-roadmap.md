# 29 - IMPLEMENTATION ROADMAP

## Objetivo

Definir a sequência oficial de implementação do ShopXpert.

Este documento orienta o Codex sobre a ordem correta de construção da plataforma.

A implementação deve seguir rigorosamente as fases abaixo.

---

# PRINCÍPIOS

Antes de iniciar qualquer fase:

* Ler toda a documentação da pasta architecture
* Ler todas as migrations do Supabase
* Respeitar o modelo de domínio
* Respeitar as permissões
* Respeitar o RLS

---

# FASE 1 - FUNDAÇÃO DO PROJETO

## Objetivo

Preparar a estrutura base da aplicação.

## Entregas

### Web

Criar:

* apps/web

Configurar:

* Next.js
* TypeScript
* ESLint
* Prettier
* App Router

---

### Mobile

Criar:

* apps/mobile

Configurar:

* Expo
* React Native
* TypeScript

---

### Shared Packages

Configurar:

* packages/ui
* packages/types
* packages/utils
* packages/constants

---

### Supabase

Configurar:

* cliente web
* cliente mobile
* providers
* environment variables

---

# Critério de conclusão

Aplicações executando localmente.

---

# FASE 2 - AUTENTICAÇÃO

## Objetivo

Implementar acesso ao sistema.

## Funcionalidades

### Cadastro

* nome
* email
* senha

---

### Login

* email
* senha

---

### Recuperação de senha

* solicitar reset
* redefinir senha

---

### Sessão

* persistência
* logout

---

### Perfis

Consumidor

Lojista

Admin

---

# Critério de conclusão

Usuários autenticando corretamente via Supabase Auth.

---

# FASE 3 - PERFIL CONSUMIDOR

## Objetivo

Implementar experiência principal do usuário.

## Funcionalidades

### Dashboard

* resumo pessoal
* economia acumulada
* notificações

---

### Perfil

* dados pessoais
* avatar

---

### Favoritos

* produtos
* estabelecimentos

---

### Histórico

* ações do usuário

---

# Critério de conclusão

Consumidor totalmente funcional.

---

# FASE 4 - LISTAS DE COMPRAS

## Funcionalidades

### Listas

* criar
* editar
* excluir

---

### Itens

* adicionar
* remover
* atualizar quantidade

---

### Organização

* ordenação
* filtros

---

# Critério de conclusão

Listas operacionais.

---

# FASE 5 - COMPARADOR DE PREÇOS

## Funcionalidades

### Comparativos

* gerar comparativo

### Economia

* calcular economia

### Melhor estabelecimento

* identificar menor valor

### Histórico

* salvar comparações

---

# Critério de conclusão

Comparação funcional utilizando dados reais.

---

# FASE 6 - CATÁLOGO DE PRODUTOS

## Funcionalidades

### Produtos

* listagem
* busca
* filtros

### Categorias

* navegação

### Detalhes

* histórico de preços
* promoções

---

# Critério de conclusão

Catálogo navegável.

---

# FASE 7 - ESTABELECIMENTOS

## Funcionalidades

### Listagem

### Busca

### Detalhes

### Avaliações

### Produtos relacionados

---

# Critério de conclusão

Estabelecimentos integrados ao catálogo.

---

# FASE 8 - PROMOÇÕES E VOUCHERS

## Funcionalidades

### Promoções

* listagem
* filtros

### Vouchers

* resgate
* histórico

### Economia

* rastreamento

---

# Critério de conclusão

Promoções utilizáveis.

---

# FASE 9 - ONBOARDING LOJISTA

## Funcionalidades

### Solicitação

* cadastro empresarial

### Documentação

* upload

### Validação

* status

---

# Critério de conclusão

Fluxo completo de solicitação de lojista.

---

# FASE 10 - PORTAL DO LOJISTA

## Funcionalidades

### Dashboard

### Estabelecimentos

### Produtos

### Preços

### Promoções

### Vouchers

### Assinatura Premium

---

# Critério de conclusão

Lojista gerenciando operação própria.

---

# FASE 11 - PAINEL ADMINISTRATIVO

## Funcionalidades

### Usuários

### Lojistas

### Estabelecimentos

### Promoções

### Analytics

### Moderação

---

# Critério de conclusão

Governança operacional completa.

---

# FASE 12 - ANALYTICS

## Funcionalidades

### KPIs

### Economia dos usuários

### Produtos mais buscados

### Estabelecimentos mais acessados

### Conversões

---

# Critério de conclusão

Indicadores funcionando.

---

# FASE 13 - POLIMENTO

## Itens

### Performance

### Acessibilidade

### Responsividade

### Testes

### Correções

---

# Critério de conclusão

Aplicação pronta para produção.

---

# ORDEM OBRIGATÓRIA

Fase 1

↓

Fase 2

↓

Fase 3

↓

Fase 4

↓

Fase 5

↓

Fase 6

↓

Fase 7

↓

Fase 8

↓

Fase 9

↓

Fase 10

↓

Fase 11

↓

Fase 12

↓

Fase 13

---

# REGRA FINAL

Nunca iniciar uma fase sem concluir a anterior.

Implementar incrementalmente.

Priorizar qualidade acima de velocidade.

---

Versão 1.0
