# Modelo de Banco de Dados - ShopXpert v1.0

## Objetivo

Este documento define a estrutura inicial do banco de dados da plataforma ShopXpert.

A modelagem foi criada para suportar:

- Consumidores
- Lojistas
- Administradores
- Produtos
- Estabelecimentos
- Comparação de preços
- Listas de compras
- Promoções
- Vouchers
- Planos Premium
- Ofertas Pagas
- Pedidos
- Avaliações
- Relatórios
- Integrações futuras via API

---

# PERFIS E USUÁRIOS

## profiles

Armazena todos os usuários da plataforma.

Campos:

- id (UUID)
- nome
- email
- telefone
- avatar_url
- tipo_usuario
- ativo
- created_at
- updated_at

Tipos de usuário:

- CONSUMIDOR
- LOJISTA
- ADMIN

---

# CONSUMIDORES

## consumidores

Campos:

- id
- profile_id
- cpf
- premium_ativo
- data_inicio_premium
- data_fim_premium
- created_at

Relacionamento:

consumidores → profiles

---

# LOJISTAS

## lojistas

Campos:

- id
- profile_id
- nome_responsavel
- cnpj
- status_validacao
- premium_ativo
- data_inicio_premium
- data_fim_premium
- created_at

Status:

- pendente
- em_analise
- aprovado
- recusado

---

# DOCUMENTAÇÃO LOJISTA

## documentos_lojista

Campos:

- id
- lojista_id
- tipo_documento
- arquivo_url
- status
- observacao_admin
- created_at

Tipos:

- RG
- CNPJ
- COMPROVANTE_RESIDENCIA
- RG_SOCIO
- COMPROVANTE_SOCIO

---

# ESTABELECIMENTOS

## estabelecimentos

Campos:

- id
- lojista_id
- nome
- descricao
- endereco
- numero
- bairro
- cidade
- estado
- cep
- latitude
- longitude
- telefone
- horario_funcionamento
- logo_url
- ativo

---

# CATEGORIAS

## categorias

Campos:

- id
- nome
- ativo

Exemplos:

- Mercearia
- Limpeza
- Higiene
- Bebidas
- Hortifruti

---

# PRODUTOS

## produtos_mestre

Representa o cadastro único de um produto na plataforma.

Exemplo:

- Arroz Tio João 5kg
- Leite Integral Itambé 1L
- Café Pilão 500g

Campos:

- id
- categoria_id
- nome
- marca
- codigo_barras
- descricao
- imagem_url
- ativo
- created_at
- updated_at

Relacionamento:

produtos_mestre → categorias

---

## produtos_estabelecimento

Representa o vínculo entre um produto mestre e um estabelecimento.

Exemplo:

- Arroz Tio João 5kg vendido pelo Mercado A
- Arroz Tio João 5kg vendido pelo Mercado B

Campos:

- id
- produto_mestre_id
- estabelecimento_id
- sku_interno
- disponivel
- ativo
- created_at
- updated_at

Relacionamentos:

produtos_estabelecimento → produtos_mestre

produtos_estabelecimento → estabelecimentos
---

# PREÇOS

## precos

Campos:

- id
- produto_estabelecimento_id
- preco
- data_atualizacao
- created_at
- updated_at

Objetivo:

Permitir histórico de preços por estabelecimento.

Relacionamento:

precos → produtos_estabelecimento
---

# PROMOÇÕES

## promocoes

Campos:

- id
- produto_id
- titulo
- descricao
- preco_promocional
- validade_inicio
- validade_fim
- imagem_url
- ativo

---

# LISTAS DE COMPRAS

## listas_compras

Campos:

- id
- consumidor_id
- nome
- total_estimado
- created_at

---

## itens_lista

Campos:

- id
- lista_id
- produto_nome
- quantidade
- unidade

---

# COMPARATIVOS

## comparativos

Campos:

- id
- consumidor_id
- lista_id
- menor_valor
- estabelecimento_vencedor
- economia_total
- created_at

Objetivo:

Guardar histórico dos comparativos.

---

# VOUCHERS

## vouchers

Campos:

- id
- estabelecimento_id
- produto_id
- titulo
- descricao
- desconto
- quantidade_disponivel
- validade
- ativo

Disponível para:

- Lojistas Premium

---

# USO DE VOUCHERS

## vouchers_utilizados

Campos:

- id
- voucher_id
- consumidor_id
- data_utilizacao
- status

Status:

- ativo
- utilizado
- expirado

---

# OFERTAS PAGAS

## ofertas_pagas

Campos:

- id
- estabelecimento_id
- produto_id
- preco_original
- preco_desconto
- quantidade_disponivel
- validade
- ativo

---

# PEDIDOS

## pedidos

Campos:

- id
- consumidor_id
- oferta_paga_id
- estabelecimento_id
- codigo_retirada
- valor_pago
- status
- created_at

Status:

- aguardando_retirada
- retirado
- cancelado
- expirado

---

# PAGAMENTOS

## pagamentos

Campos:

- id
- pedido_id
- gateway
- valor
- status
- transaction_id
- created_at

Status:

- pendente
- aprovado
- recusado
- estornado

---

# AVALIAÇÕES

## avaliacoes

Campos:

- id
- consumidor_id
- estabelecimento_id
- nota
- comentario
- created_at

Notas:

- 1
- 2
- 3
- 4
- 5

---

# RELATÓRIOS

## eventos_analytics

Campos:

- id
- usuario_id
- evento
- origem
- created_at

Eventos:

- visualizacao_produto
- clique_promocao
- uso_voucher
- compra_oferta
- comparativo_realizado

---

# ASSINATURAS

## assinaturas

Campos:

- id
- profile_id
- tipo_plano
- status
- inicio
- fim

Planos:

Consumidor:

- gratuito
- premium

Lojista:

- gratuito
- premium

---

# NOTIFICAÇÕES

## notificacoes

Campos:

- id
- usuario_id
- titulo
- mensagem
- lida
- created_at

---

# INTEGRAÇÕES

## integracoes_api

Campos:

- id
- estabelecimento_id
- api_key
- sistema_origem
- ativo
- created_at

Objetivo:

Integração futura com ERPs e supermercados.

---

# STORAGE SUPABASE

Buckets previstos:

- avatars
- produtos
- estabelecimentos
- documentos
- promocoes
- vouchers

---

# PERFIS DE ACESSO

CONSUMIDOR

Pode:

- criar listas
- comparar preços
- comprar ofertas
- utilizar vouchers
- avaliar estabelecimentos

---

LOJISTA

Pode:

- cadastrar produtos
- cadastrar promoções
- cadastrar vouchers
- acompanhar relatórios

---

ADMIN

Pode:

- aprovar lojistas
- validar documentos
- gerenciar plataforma
- visualizar relatórios globais

---

Fim da versão 1.0