# Modelo Inicial do Banco de Dados - Supabase

Este arquivo serve como guia inicial. O SQL final será criado na etapa de modelagem Supabase.

## Tabelas sugeridas

### profiles
- id
- nome
- email
- telefone
- tipo_usuario
- avatar_url
- ativo
- created_at

### consumidores
- id
- profile_id
- cpf
- premium_ativo
- created_at

### lojistas
- id
- profile_id
- nome_responsavel
- cnpj
- status_validacao
- premium_ativo
- created_at

### estabelecimentos
- id
- lojista_id
- nome
- endereco
- cidade
- estado
- latitude
- longitude
- telefone
- horario_funcionamento
- ativo

### documentos_lojista
- id
- lojista_id
- tipo_documento
- arquivo_url
- status
- observacao_admin

### categorias
- id
- nome
- ativo

### produtos
- id
- estabelecimento_id
- categoria_id
- nome
- codigo
- descricao
- imagem_url
- ativo

### precos
- id
- produto_id
- preco
- data_atualizacao

### promocoes
- id
- produto_id
- preco_promocional
- validade_inicio
- validade_fim
- ativo

### vouchers
- id
- estabelecimento_id
- produto_id
- titulo
- desconto
- quantidade
- validade
- ativo

### listas_compras
- id
- consumidor_id
- nome
- total_estimado
- created_at

### itens_lista
- id
- lista_id
- produto_nome
- quantidade
- unidade

### ofertas_pagas
- id
- produto_id
- preco_original
- preco_desconto
- quantidade_disponivel
- validade
- ativo

### pedidos
- id
- consumidor_id
- oferta_paga_id
- estabelecimento_id
- codigo_retirada
- status
- valor_pago
- created_at

### avaliacoes
- id
- consumidor_id
- estabelecimento_id
- nota
- comentario
- created_at

### assinaturas
- id
- profile_id
- tipo_plano
- status
- inicio
- fim

## Status de pedidos

- aguardando_retirada
- retirado
- cancelado
- expirado

## Status de validação lojista

- pendente
- em_analise
- aprovado
- recusado
