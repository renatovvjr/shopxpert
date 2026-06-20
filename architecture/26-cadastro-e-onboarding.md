# Cadastro e Onboarding - ShopXpert

## Objetivo

Definir o fluxo oficial de entrada de usuários na plataforma.

---

# Princípios

Todo usuário inicia sua jornada como consumidor.

Nenhum usuário nasce como lojista.

Nenhum usuário nasce como administrador.

---

# Fluxo de Cadastro

## Etapa 1 - Registro

Usuário informa:

* Nome
* E-mail
* Senha

Sistema cria:

* auth.users
* profiles

Perfil inicial:

```txt
tipo_usuario = CONSUMIDOR
ativo = true
```

---

# Etapa 2 - Consumidor

Consumidor pode:

* Criar listas
* Comparar preços
* Favoritar produtos
* Favoritar estabelecimentos
* Utilizar vouchers
* Avaliar estabelecimentos
* Receber notificações

Não necessita validação administrativa.

---

# Etapa 3 - Solicitação de Lojista

Consumidor pode solicitar tornar-se lojista.

Deve informar:

* Nome responsável
* CNPJ

Sistema cria:

```txt
lojistas
```

com:

```txt
status_validacao = pendente
premium_ativo = false
```

---

# Etapa 4 - Validação Administrativa

Administrador analisa:

* CNPJ
* Documentação
* Dados do responsável

Status possíveis:

* pendente
* em_analise
* aprovado
* rejeitado

---

# Etapa 5 - Lojista Aprovado

Após aprovação:

O lojista pode:

* Criar estabelecimentos
* Cadastrar produtos
* Atualizar preços
* Criar promoções
* Assinar plano premium

---

# Conversão de Perfis

Consumidor → Lojista

Permitido.

Lojista → Consumidor

Permitido.

Administrador → Manual.

---

# Regras

Administradores são criados apenas manualmente.

Lojistas dependem de aprovação.

Consumidores possuem aprovação automática.

---

Versão 1.0
