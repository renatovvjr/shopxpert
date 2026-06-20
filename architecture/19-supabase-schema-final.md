# Supabase Schema Final - ShopXpert

## Objetivo

Definir o schema final que será implementado no Supabase.

Este documento servirá como fonte oficial para:

* Migrations SQL
* Policies RLS
* Storage
* Edge Functions
* Integrações
* Codex

---

# PADRÕES GERAIS

Todas as tabelas deverão possuir:

* id UUID PRIMARY KEY
* created_at TIMESTAMP
* updated_at TIMESTAMP

Sempre que aplicável.

---

# AUTH

Utilizar:

Supabase Auth

Métodos:

* Email + Senha
* Google Login (futuro)
* Apple Login (futuro)

---

# TABELA

## profiles

Campos:

* id
* nome
* email
* telefone
* avatar_url
* tipo_usuario
* ativo

Tipos:

* CONSUMIDOR
* LOJISTA
* ADMIN

---

# TABELA

## consumidores

Campos:

* id
* profile_id
* cpf
* premium_ativo
* data_inicio_premium
* data_fim_premium

---

# TABELA

## lojistas

Campos:

* id
* profile_id
* nome_responsavel
* cnpj
* status_validacao
* premium_ativo
* data_inicio_premium
* data_fim_premium

Status:

* pendente
* em_analise
* aprovado
* recusado

---

# TABELA

## documentos_lojista

Campos:

* id
* lojista_id
* tipo_documento
* arquivo_url
* status
* observacao_admin

Tipos:

* RG
* CNPJ
* COMPROVANTE_RESIDENCIA
* RG_SOCIO
* COMPROVANTE_SOCIO

---

# TABELA

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

---

# TABELA

## categorias

Campos:

* id
* nome
* ativo

---

# TABELA

## produtos_mestre

Representa o produto único da plataforma.

Exemplos:

* Arroz Tio João 5kg
* Leite Integral Itambé 1L
* Café Pilão 500g

Campos:

* id
* categoria_id
* nome
* marca
* codigo_barras
* descricao
* imagem_url
* ativo

---

# TABELA

## produtos_estabelecimento

Representa o mesmo produto dentro de um estabelecimento.

Campos:

* id
* produto_mestre_id
* estabelecimento_id
* sku_interno
* disponivel
* ativo

---

# TABELA

## precos

Campos:

* id
* produto_estabelecimento_id
* preco
* data_atualizacao

Objetivo:

Histórico de preços por estabelecimento.

---

# TABELA

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

---

# TABELA

## listas_compras

Campos:

* id
* consumidor_id
* nome
* total_estimado

---

# TABELA

## itens_lista

Campos:

* id
* lista_id
* produto_nome
* quantidade
* unidade

---

# TABELA

## comparativos

Campos:

* id
* consumidor_id
* lista_id
* menor_valor
* estabelecimento_vencedor
* economia_total

---

# TABELA

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

---

# TABELA

## vouchers_utilizados

Campos:

* id
* voucher_id
* consumidor_id
* data_utilizacao
* status

Status:

* ativo
* utilizado
* expirado

---

# TABELA

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

---

# TABELA

## pedidos

Campos:

* id
* consumidor_id
* oferta_paga_id
* estabelecimento_id
* codigo_retirada
* valor_pago
* status

Status:

* aguardando_retirada
* retirado
* cancelado
* expirado

---

# TABELA

## pagamentos

Campos:

* id
* pedido_id
* gateway
* transaction_id
* valor
* status

Gateways previstos:

* Asaas
* Mercado Pago
* Stripe

Status:

* pendente
* aprovado
* recusado
* estornado

---

# TABELA

## avaliacoes

Campos:

* id
* consumidor_id
* estabelecimento_id
* nota
* comentario

Notas:

* 1
* 2
* 3
* 4
* 5

---

# TABELA

## assinaturas

Campos:

* id
* profile_id
* tipo_plano
* status
* inicio
* fim

Planos:

Consumidor:

* gratuito
* premium

Lojista:

* gratuito
* premium

---

# TABELA

## notificacoes

Campos:

* id
* usuario_id
* titulo
* mensagem
* lida

---

# TABELA

## eventos_analytics

Campos:

* id
* usuario_id
* evento
* origem

Eventos previstos:

* busca_produto
* criar_lista
* comparar_precos
* visualizar_promocao
* utilizar_voucher
* comprar_oferta_paga
* criar_produto
* criar_promocao
* criar_voucher

---

# TABELA

## integracoes_api

Campos:

* id
* estabelecimento_id
* api_key
* sistema_origem
* ativo

Objetivo:

Integração futura com:

* ERP
* PDV
* Sistemas de supermercados
* Delivery

---

# STORAGE BUCKETS

## avatars

Privado

Utilização:

* Fotos de consumidores
* Fotos de lojistas
* Fotos de administradores

---

## produtos

Público

Utilização:

* Imagens dos produtos

---

## estabelecimentos

Público

Utilização:

* Logos
* Banners
* Fotos das lojas

---

## documentos

Privado

Utilização:

* RG
* CNPJ
* Comprovantes
* Documentação societária

---

## promocoes

Público

Utilização:

* Banners promocionais

---

## vouchers

Público

Utilização:

* Artes dos vouchers

---

# EDGE FUNCTIONS PREVISTAS

## compare-prices

Objetivo:

Calcular o estabelecimento com menor valor para uma lista.

---

## create-withdraw-code

Objetivo:

Gerar código único de retirada.

---

## validate-voucher

Objetivo:

Validar voucher.

---

## analytics-event

Objetivo:

Registrar eventos.

---

## subscription-check

Objetivo:

Validar status premium.

---

# ÍNDICES IMPORTANTES

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

# POLÍTICAS RLS

Todas as tabelas deverão utilizar Row Level Security.

As permissões deverão seguir:

* 11-matriz-de-permissoes.md

---

# OBSERVAÇÃO ARQUITETURAL

A separação entre:

* produtos_mestre
* produtos_estabelecimento

é obrigatória.

Essa estrutura permitirá:

* comparação de preços eficiente
* histórico de preços
* leitura futura por código de barras
* integração com ERPs
* expansão nacional da plataforma

---

# STATUS

Este documento representa a estrutura oficial do banco da versão MVP.

---

Fim da versão 2.0

