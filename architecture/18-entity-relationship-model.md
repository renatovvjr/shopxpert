# Entity Relationship Model (ERD) - ShopXpert

## Objetivo

Definir os relacionamentos entre todas as entidades da plataforma ShopXpert.

Este documento será utilizado para:

* PostgreSQL
* Supabase
* Migrations
* APIs
* Codex
* Diagramas ERD

---

# PERFIS

## profiles

Representa todos os usuários da plataforma.

Tipos:

* CONSUMIDOR
* LOJISTA
* ADMIN

Relacionamentos:

profiles (1) → (1) consumidores

profiles (1) → (1) lojistas

profiles (1) → (N) assinaturas

profiles (1) → (N) notificacoes

profiles (1) → (N) eventos_analytics

---

# CONSUMIDORES

## consumidores

Relacionamentos:

consumidores (1) → (N) listas_compras

consumidores (1) → (N) comparativos

consumidores (1) → (N) pedidos

consumidores (1) → (N) avaliacoes

consumidores (1) → (N) vouchers_utilizados

---

# LOJISTAS

## lojistas

Relacionamentos:

lojistas (1) → (N) estabelecimentos

lojistas (1) → (N) documentos_lojista

---

# DOCUMENTAÇÃO

## documentos_lojista

Relacionamentos:

documentos_lojista (N) → (1) lojistas

---

# ESTABELECIMENTOS

## estabelecimentos

Relacionamentos:

estabelecimentos (N) → (1) lojistas

estabelecimentos (1) → (N) produtos_estabelecimento

estabelecimentos (1) → (N) vouchers

estabelecimentos (1) → (N) ofertas_pagas

estabelecimentos (1) → (N) avaliacoes

estabelecimentos (1) → (N) integracoes_api

---

# CATEGORIAS

## categorias

Relacionamentos:

categorias (1) → (N) produtos_mestre

---

# PRODUTOS MESTRE

## produtos_mestre

Representa o produto único da plataforma.

Exemplos:

* Arroz Tio João 5kg
* Leite Integral Itambé 1L
* Café Pilão 500g

Relacionamentos:

produtos_mestre (N) → (1) categorias

produtos_mestre (1) → (N) produtos_estabelecimento

---

# PRODUTOS ESTABELECIMENTO

## produtos_estabelecimento

Representa o vínculo entre um produto mestre e um estabelecimento.

Exemplo:

Arroz Tio João 5kg vendido pelo Mercado A.

Relacionamentos:

produtos_estabelecimento (N) → (1) produtos_mestre

produtos_estabelecimento (N) → (1) estabelecimentos

produtos_estabelecimento (1) → (N) precos

produtos_estabelecimento (1) → (N) promocoes

produtos_estabelecimento (1) → (N) vouchers

produtos_estabelecimento (1) → (N) ofertas_pagas

---

# PREÇOS

## precos

Relacionamentos:

precos (N) → (1) produtos_estabelecimento

Objetivo:

Histórico de preços por estabelecimento.

---

# PROMOÇÕES

## promocoes

Relacionamentos:

promocoes (N) → (1) produtos_estabelecimento

---

# LISTAS DE COMPRAS

## listas_compras

Relacionamentos:

listas_compras (N) → (1) consumidores

listas_compras (1) → (N) itens_lista

listas_compras (1) → (N) comparativos

---

# ITENS DA LISTA

## itens_lista

Relacionamentos:

itens_lista (N) → (1) listas_compras

---

# COMPARATIVOS

## comparativos

Relacionamentos:

comparativos (N) → (1) consumidores

comparativos (N) → (1) listas_compras

---

# VOUCHERS

## vouchers

Relacionamentos:

vouchers (N) → (1) estabelecimentos

vouchers (N) → (1) produtos_estabelecimento

vouchers (1) → (N) vouchers_utilizados

---

# VOUCHERS UTILIZADOS

## vouchers_utilizados

Relacionamentos:

vouchers_utilizados (N) → (1) vouchers

vouchers_utilizados (N) → (1) consumidores

---

# OFERTAS PAGAS

## ofertas_pagas

Relacionamentos:

ofertas_pagas (N) → (1) estabelecimentos

ofertas_pagas (N) → (1) produtos_estabelecimento

ofertas_pagas (1) → (N) pedidos

---

# PEDIDOS

## pedidos

Relacionamentos:

pedidos (N) → (1) consumidores

pedidos (N) → (1) ofertas_pagas

pedidos (N) → (1) estabelecimentos

pedidos (1) → (1) pagamentos

---

# PAGAMENTOS

## pagamentos

Relacionamentos:

pagamentos (1) → (1) pedidos

---

# AVALIAÇÕES

## avaliacoes

Relacionamentos:

avaliacoes (N) → (1) consumidores

avaliacoes (N) → (1) estabelecimentos

---

# ASSINATURAS

## assinaturas

Relacionamentos:

assinaturas (N) → (1) profiles

Objetivo:

Assinaturas premium.

---

# NOTIFICAÇÕES

## notificacoes

Relacionamentos:

notificacoes (N) → (1) profiles

---

# ANALYTICS

## eventos_analytics

Relacionamentos:

eventos_analytics (N) → (1) profiles

---

# INTEGRAÇÕES

## integracoes_api

Relacionamentos:

integracoes_api (N) → (1) estabelecimentos

---

# VISÃO RESUMIDA

profiles
│
├── consumidores
│   ├── listas_compras
│   │   ├── itens_lista
│   │   └── comparativos
│   ├── pedidos
│   ├── avaliacoes
│   └── vouchers_utilizados
│
├── lojistas
│   ├── documentos_lojista
│   └── estabelecimentos
│       │
│       ├── produtos_estabelecimento
│       │   ├── precos
│       │   ├── promocoes
│       │   ├── vouchers
│       │   └── ofertas_pagas
│       │
│       ├── avaliacoes
│       └── integracoes_api
│
├── assinaturas
│
├── notificacoes
│
└── eventos_analytics

categorias
│
└── produtos_mestre
│
└── produtos_estabelecimento

ofertas_pagas
│
└── pedidos
│
└── pagamentos

vouchers
│
└── vouchers_utilizados

---

# OBSERVAÇÃO IMPORTANTE

Todos os relacionamentos devem utilizar UUID como chave primária e chave estrangeira.

Todos os registros devem possuir:

* created_at
* updated_at

Sempre que aplicável.

---

# OBSERVAÇÃO ARQUITETURAL

A separação entre:

* produtos_mestre
* produtos_estabelecimento

é obrigatória para permitir:

* comparação de preços entre mercados
* histórico de preços
* leitura por código de barras
* escalabilidade da plataforma
* futuras funcionalidades de inteligência de consumo

---

Fim da versão 2.0
