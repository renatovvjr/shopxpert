# Roadmap Supabase - ShopXpert

## Objetivo

Definir a ordem correta de implementação do Supabase para evitar retrabalho e garantir escalabilidade.

Este documento servirá como guia para:

* Supabase
* Codex
* Backend
* APIs
* Segurança
* Deploy

---

# FASE 1 - CRIAÇÃO DO PROJETO

## Criar Projeto

Nome sugerido:

shopxpert-prod

Região sugerida:

São Paulo (Brazil)

---

# FASE 2 - AUTENTICAÇÃO

## Habilitar

* Email + Senha
* Google Login
* Apple Login (futuro)

---

## Perfis

* CONSUMIDOR
* LOJISTA
* ADMIN

Todos utilizarão a tabela profiles.

---

# FASE 3 - STORAGE

Criar os buckets:

## avatars

Privado

Utilização:

* foto consumidor
* foto lojista
* foto admin

---

## produtos

Público

Utilização:

* imagens dos produtos

---

## estabelecimentos

Público

Utilização:

* logos
* fotos das lojas

---

## documentos

Privado

Utilização:

* RG
* CNPJ
* comprovantes

---

## promocoes

Público

Utilização:

* banners promocionais

---

## vouchers

Público

Utilização:

* imagens dos vouchers

---

# FASE 4 - TABELAS

Criar inicialmente:

1. profiles
2. consumidores
3. lojistas
4. documentos_lojista
5. estabelecimentos
6. categorias
7. produtos
8. precos
9. promocoes

---

# FASE 5 - TABELAS DE COMPARAÇÃO

10. listas_compras
11. itens_lista
12. comparativos

---

# FASE 6 - MONETIZAÇÃO

13. assinaturas
14. vouchers
15. vouchers_utilizados
16. ofertas_pagas
17. pedidos
18. pagamentos

---

# FASE 7 - ENGAJAMENTO

19. avaliacoes
20. notificacoes
21. eventos_analytics

---

# FASE 8 - INTEGRAÇÕES

22. integracoes_api

Preparação para:

* ERP
* supermercados
* delivery
* gateways

---

# FASE 9 - POLÍTICAS RLS

## Consumidor

Pode:

* ler dados públicos
* editar dados próprios
* criar listas
* criar pedidos

---

## Lojista

Pode:

* editar seus produtos
* editar sua loja
* criar promoções
* criar vouchers premium

---

## Admin

Acesso total.

---

# FASE 10 - EDGE FUNCTIONS

Criar futuramente:

## Comparador de preços

Objetivo:

calcular melhor mercado.

---

## Validação de vouchers

Objetivo:

validar uso.

---

## Geração de código de retirada

Objetivo:

gerar código único.

---

## Analytics

Objetivo:

registrar eventos.

---

# FASE 11 - PAGAMENTOS

Preparar integração:

* Stripe
* Mercado Pago
* Asaas

Decisão futura.

---

# FASE 12 - CODEX

Somente após concluir:

* documentação
* arquitetura
* banco
* permissões

O Codex deverá gerar:

* migrations
* models
* services
* telas
* integrações

---

Fim da versão 1.0
