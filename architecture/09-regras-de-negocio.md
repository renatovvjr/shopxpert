# Regras de Negócio - ShopXpert

## Objetivo

Este documento define as regras de negócio da plataforma ShopXpert.

Estas regras serão utilizadas como referência para:

* Desenvolvimento
* Banco de Dados
* Supabase
* APIs
* Codex
* Testes
* Painel Administrativo

---

# REGRA 01 - Cadastro de Consumidor

Um consumidor pode criar apenas uma conta por e-mail.

O CPF poderá ser utilizado para validações futuras.

Consumidores podem utilizar a plataforma gratuitamente.

---

# REGRA 02 - Cadastro de Lojista

O lojista poderá se cadastrar de duas formas:

## Opção 1

Validação via GOV.BR

## Opção 2

Envio manual de documentos

Documentos obrigatórios:

* RG frente
* RG verso
* Cartão CNPJ
* Comprovante de residência

Caso possua sócio:

* RG do sócio
* Comprovante do sócio

---

# REGRA 03 - Aprovação do Lojista

Após envio da documentação:

Status:

* pendente
* em análise
* aprovado
* recusado

Somente lojistas aprovados podem acessar o Dashboard.

---

# REGRA 04 - Produtos

Todo produto pertence a um estabelecimento.

Todo produto deve possuir:

* nome
* categoria
* preço

Imagem é opcional.

---

# REGRA 05 - Histórico de Preços

Todo preço alterado deve gerar um novo registro.

Não apagar histórico.

---

# REGRA 06 - Promoções

Promoções possuem:

* data início
* data fim

Promoções vencidas não devem ser exibidas aos consumidores.

---

# REGRA 07 - Lista de Compras

Consumidores podem criar listas ilimitadas.

Cada lista pode possuir vários itens.

O sistema deverá calcular:

* valor total
* menor mercado
* economia estimada

---

# REGRA 08 - Comparação de Preços

A comparação deverá considerar:

* localização do consumidor
* produtos da lista
* preços ativos

O sistema deverá exibir:

* estabelecimento mais barato
* economia gerada
* ranking dos estabelecimentos

---

# REGRA 09 - Plano Premium Consumidor

Benefícios:

* acesso a descontos exclusivos
* acesso a vouchers especiais
* acesso a ofertas pagas exclusivas

---

# REGRA 10 - Plano Premium Lojista

Benefícios:

* criação de vouchers
* destaque em resultados
* campanhas promocionais

---

# REGRA 11 - Vouchers

Somente lojistas premium podem criar vouchers.

Todo voucher deve possuir:

* validade
* quantidade disponível
* valor do desconto

---

# REGRA 12 - Uso de Voucher

Um voucher não pode ser reutilizado após utilização.

Status possíveis:

* ativo
* utilizado
* expirado

---

# REGRA 13 - Ofertas Pagas

Uma oferta paga é um produto vendido através do ShopXpert com desconto.

A compra gera:

* pedido
* pagamento
* código de retirada

---

# REGRA 14 - Retirada na Loja

O consumidor deverá apresentar:

* QR Code
  ou
* Código de retirada

O lojista confirma a entrega.

---

# REGRA 15 - Pagamentos

Pagamentos devem registrar:

* valor
* gateway
* transaction_id
* status

---

# REGRA 16 - Avaliações

Consumidores podem avaliar apenas estabelecimentos onde houve interação.

Notas:

* 1
* 2
* 3
* 4
* 5

---

# REGRA 17 - Analytics

Registrar eventos:

* busca realizada
* comparativo realizado
* promoção visualizada
* voucher utilizado
* oferta comprada

---

# REGRA 18 - Segurança

Consumidores não podem acessar dados de outros consumidores.

Lojistas não podem acessar dados de outros lojistas.

Admin possui acesso global.

---

# REGRA 19 - LGPD

Dados pessoais devem ser protegidos.

Documentos enviados pelos lojistas devem ficar armazenados em bucket privado.

---

# REGRA 20 - Futuras Integrações

A plataforma deverá permitir integração futura com:

* ERPs
* Sistemas de supermercados
* Sistemas de entrega
* Marketplaces
* Gateways de pagamento
