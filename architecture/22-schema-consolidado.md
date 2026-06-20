# Schema Consolidado Oficial - ShopXpert

## Objetivo

Este documento representa a fonte oficial da arquitetura de dados do ShopXpert.

Substitui e consolida:

* 18-entity-relationship-model.md
* 19-supabase-schema-final.md
* 21-revisao-final-arquitetura.md

A partir deste documento serão gerados:

* SQL Migrations
* RLS Policies
* Edge Functions
* APIs
* Services
* Codex Prompts

---

# STACK OFICIAL

## Backend

* Supabase
* PostgreSQL
* Supabase Auth
* Supabase Storage
* Supabase Edge Functions

## Frontend

* Expo React Native
* Next.js
* TypeScript
* Tailwind
* Shadcn UI (Web)

## Arquitetura

Monorepo

```txt
apps/
packages/
supabase/
```

---

# TIPOS DE USUÁRIO

## Consumidor

Objetivos:

* Comparar preços
* Criar listas
* Utilizar vouchers
* Comprar ofertas pagas
* Receber promoções

---

## Lojista

Objetivos:

* Cadastrar estabelecimento
* Cadastrar produtos
* Publicar promoções
* Criar vouchers
* Publicar ofertas pagas

---

## Administrador

Objetivos:

* Validar lojistas
* Moderar conteúdo
* Gerenciar usuários
* Visualizar métricas

---

# STORAGE

## avatars

Privado

Uso:

* foto consumidor
* foto lojista
* foto admin

---

## produtos

Público

Uso:

* imagens dos produtos

---

## estabelecimentos

Público

Uso:

* logo
* banner
* galeria

---

## documentos

Privado

Uso:

* RG
* CPF
* CNPJ
* comprovantes

---

## promocoes

Público

Uso:

* banners promocionais

---

## vouchers

Público

Uso:

* imagens de vouchers

---

# TABELAS

## profiles

Campos:

* id
* nome
* email
* telefone
* avatar_url
* tipo_usuario
* ativo

Relacionamentos:

profiles → consumidores

profiles → lojistas

profiles → assinaturas

profiles → notificacoes

profiles → eventos_analytics

---

## consumidores

Campos:

* id
* profile_id
* cpf
* premium_ativo
* data_inicio_premium
* data_fim_premium

Relacionamentos:

consumidores → listas_compras

consumidores → comparativos

consumidores → pedidos

consumidores → avaliacoes

consumidores → vouchers_utilizados

consumidores → favoritos

consumidores → economias_usuario

---

## lojistas

Campos:

* id
* profile_id
* nome_responsavel
* cnpj
* status_validacao

Relacionamentos:

lojistas → estabelecimentos

lojistas → documentos_lojista

---

## documentos_lojista

Campos:

* id
* lojista_id
* tipo_documento
* arquivo_url
* status
* observacao_admin

---

## estabelecimentos

Campos:

* id
* lojista_id
* nome
* descricao
* endereco
* numero
* bairro
* cidade
* estado
* cep
* latitude
* longitude
* telefone
* horario_funcionamento
* logo_url
* ativo

Relacionamentos:

estabelecimentos → produtos_estabelecimento

estabelecimentos → vouchers

estabelecimentos → ofertas_pagas

estabelecimentos → avaliacoes

estabelecimentos → integracoes_api

---

## categorias

Campos:

* id
* nome
* ativo

Relacionamentos:

categorias → produtos_mestre

---

## produtos_mestre

Representa um produto único da plataforma.

Exemplos:

* Arroz Tio João 5kg
* Café Pilão 500g
* Leite Integral 1L

Campos:

* id
* categoria_id
* nome
* marca
* codigo_barras
* descricao
* imagem_url
* ativo

Relacionamentos:

produtos_mestre → produtos_estabelecimento

produtos_mestre → favoritos

---

## produtos_estabelecimento

Representa um produto em uma loja específica.

Campos:

* id
* produto_mestre_id
* estabelecimento_id
* sku_interno
* disponivel
* ativo

Relacionamentos:

produtos_estabelecimento → precos

produtos_estabelecimento → promocoes

produtos_estabelecimento → vouchers

produtos_estabelecimento → ofertas_pagas

produtos_estabelecimento → historico_precos

---

## precos

Campos:

* id
* produto_estabelecimento_id
* preco
* data_atualizacao

Objetivo:

Histórico de preços.

---

## historico_precos

Campos:

* id
* produto_estabelecimento_id
* preco_anterior
* preco_novo
* alterado_por
* origem_alteracao

Objetivo:

Auditoria.

---

## promocoes

Campos:

* id
* produto_estabelecimento_id
* titulo
* descricao
* preco_promocional
* validade_inicio
* validade_fim
* imagem_url
* ativo

Relacionamentos:

promocoes → favoritos

---

## listas_compras

Campos:

* id
* consumidor_id
* nome
* total_estimado

Relacionamentos:

listas_compras → itens_lista

listas_compras → comparativos

listas_compras → economias_usuario

---

## itens_lista

Campos:

* id
* lista_id
* produto_mestre_id
* quantidade
* unidade

Observação:

Utilizar produto_mestre_id como referência principal.

---

## comparativos

Campos:

* id
* consumidor_id
* lista_id
* menor_valor
* estabelecimento_vencedor
* economia_total

---

## vouchers

Campos:

* id
* estabelecimento_id
* produto_estabelecimento_id
* titulo
* descricao
* desconto
* quantidade_disponivel
* validade
* ativo

Relacionamentos:

vouchers → vouchers_utilizados

vouchers → economias_usuario

---

## vouchers_utilizados

Campos:

* id
* voucher_id
* consumidor_id
* data_utilizacao
* status

---

## ofertas_pagas

Campos:

* id
* estabelecimento_id
* produto_estabelecimento_id
* preco_original
* preco_desconto
* quantidade_disponivel
* validade
* ativo

Relacionamentos:

ofertas_pagas → pedidos

---

## pedidos

Campos:

* id
* consumidor_id
* oferta_paga_id
* estabelecimento_id
* codigo_retirada
* valor_pago
* status

Relacionamentos:

pedidos → pagamentos

pedidos → economias_usuario

---

## pagamentos

Campos:

* id
* pedido_id
* gateway
* transaction_id
* valor
* status

---

## avaliacoes

Campos:

* id
* consumidor_id
* estabelecimento_id
* nota
* comentario

---

## assinaturas

Campos:

* id
* profile_id
* tipo_plano
* status
* inicio
* fim

---

## notificacoes

Campos:

* id
* usuario_id
* titulo
* mensagem
* lida

---

## eventos_analytics

Campos:

* id
* usuario_id
* evento
* origem

---

## integracoes_api

Campos:

* id
* estabelecimento_id
* api_key
* sistema_origem
* ativo

---

## favoritos

Campos:

* id
* consumidor_id
* produto_mestre_id
* estabelecimento_id
* promocao_id
* tipo_favorito

Tipos:

* produto
* estabelecimento
* promocao

---

## economias_usuario

Campos:

* id
* consumidor_id
* lista_id
* pedido_id
* voucher_id
* valor_estimado_sem_shopxpert
* valor_pago_ou_estimado
* economia_gerada
* origem

Origens:

* comparativo
* voucher
* oferta_paga
* promocao

---

# EDGE FUNCTIONS

## compare-prices

Calcula o melhor estabelecimento.

---

## create-withdraw-code

Gera código de retirada.

---

## validate-voucher

Valida vouchers.

---

## analytics-event

Registra eventos.

---

## subscription-check

Valida assinatura.

---

# ÍNDICES OBRIGATÓRIOS

Criar índices para:

* email
* cpf
* cnpj
* codigo_barras
* categoria_id
* produto_mestre_id
* produto_estabelecimento_id
* estabelecimento_id
* consumidor_id
* lojista_id
* status

---

# RLS

Todas as tabelas devem utilizar Row Level Security.

A matriz oficial de permissões está definida em:

11-matriz-de-permissoes.md

---

# DECISÃO ARQUITETURAL PRINCIPAL

A separação entre:

* produtos_mestre
* produtos_estabelecimento

é obrigatória.

Essa decisão viabiliza:

* comparação de preços
* histórico de preços
* leitura por código de barras
* integração com ERP
* escalabilidade nacional

---

# STATUS

Versão oficial consolidada do ShopXpert.

Esta é a referência única para implementação.

---

Fim da versão 3.0
