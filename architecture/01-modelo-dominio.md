# Modelo de Domínio - ShopXpert

## Entidades principais

- Usuário
- Perfil
- Consumidor
- Lojista
- Estabelecimento
- Produto
- Categoria
- Preço
- Promoção
- Voucher
- Plano Premium
- Assinatura
- Oferta Paga
- Pedido
- Lista de Compras
- Item da Lista
- Avaliação
- Documento do Lojista
- Integração API
- Relatório

## Perfis de acesso

- CONSUMIDOR
- LOJISTA
- ADMIN

## Regras centrais

- Todo usuário possui um perfil.
- Um lojista pode ter um ou mais estabelecimentos.
- Um estabelecimento pode possuir produtos, preços, promoções e vouchers.
- Consumidores podem criar listas de compras e comparar preços.
- Consumidores premium podem acessar descontos exclusivos.
- Lojistas premium podem criar e distribuir vouchers.
- Ofertas pagas geram pedidos com código de retirada.
- Admin valida documentos e aprova lojistas.
