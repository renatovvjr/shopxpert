# Matriz de Permissões - ShopXpert

## Objetivo

Este documento define quais ações cada perfil pode executar dentro da plataforma.

Perfis:

* CONSUMIDOR
* LOJISTA
* ADMIN

Esta matriz será utilizada para:

* Políticas RLS do Supabase
* Segurança
* APIs
* Frontend
* Auditoria

---

# PERFIL: CONSUMIDOR

## Profiles

| Ação                      | Permissão |
| ------------------------- | --------- |
| Visualizar próprio perfil | SIM       |
| Editar próprio perfil     | SIM       |
| Visualizar outros perfis  | NÃO       |
| Editar outros perfis      | NÃO       |

---

## Listas de Compras

| Ação                          | Permissão |
| ----------------------------- | --------- |
| Criar lista                   | SIM       |
| Editar lista própria          | SIM       |
| Excluir lista própria         | SIM       |
| Visualizar lista própria      | SIM       |
| Visualizar lista de terceiros | NÃO       |

---

## Comparativos

| Ação                                 | Permissão |
| ------------------------------------ | --------- |
| Criar comparativo                    | SIM       |
| Visualizar comparativos próprios     | SIM       |
| Visualizar comparativos de terceiros | NÃO       |

---

## Promoções

| Ação                 | Permissão |
| -------------------- | --------- |
| Visualizar promoções | SIM       |
| Criar promoções      | NÃO       |
| Editar promoções     | NÃO       |
| Excluir promoções    | NÃO       |

---

## Vouchers

| Ação                            | Permissão |
| ------------------------------- | --------- |
| Visualizar vouchers disponíveis | SIM       |
| Utilizar voucher                | SIM       |
| Criar voucher                   | NÃO       |
| Excluir voucher                 | NÃO       |

---

## Ofertas Pagas

| Ação              | Permissão |
| ----------------- | --------- |
| Comprar oferta    | SIM       |
| Visualizar oferta | SIM       |
| Criar oferta      | NÃO       |
| Editar oferta     | NÃO       |

---

## Pedidos

| Ação                            | Permissão |
| ------------------------------- | --------- |
| Criar pedido                    | SIM       |
| Visualizar pedidos próprios     | SIM       |
| Visualizar pedidos de terceiros | NÃO       |

---

## Avaliações

| Ação                           | Permissão |
| ------------------------------ | --------- |
| Criar avaliação                | SIM       |
| Editar avaliação própria       | SIM       |
| Excluir avaliação própria      | SIM       |
| Visualizar avaliações públicas | SIM       |

---

# PERFIL: LOJISTA

## Perfil da Loja

| Ação                         | Permissão |
| ---------------------------- | --------- |
| Visualizar própria loja      | SIM       |
| Editar própria loja          | SIM       |
| Visualizar loja de terceiros | NÃO       |
| Editar loja de terceiros     | NÃO       |

---

## Produtos

| Ação                         | Permissão |
| ---------------------------- | --------- |
| Criar produto                | SIM       |
| Editar produto próprio       | SIM       |
| Excluir produto próprio      | SIM       |
| Visualizar produto próprio   | SIM       |
| Visualizar produtos públicos | SIM       |

---

## Promoções

| Ação                        | Permissão |
| --------------------------- | --------- |
| Criar promoção              | SIM       |
| Editar promoção própria     | SIM       |
| Excluir promoção própria    | SIM       |
| Visualizar promoção própria | SIM       |

---

## Relatórios

| Ação                           | Permissão |
| ------------------------------ | --------- |
| Visualizar relatórios próprios | SIM       |
| Visualizar relatórios globais  | NÃO       |

---

## Vouchers

| Ação                       | Permissão       |
| -------------------------- | --------------- |
| Criar voucher              | SOMENTE PREMIUM |
| Editar voucher próprio     | SOMENTE PREMIUM |
| Excluir voucher próprio    | SOMENTE PREMIUM |
| Visualizar voucher próprio | SIM             |

---

## Ofertas Pagas

| Ação                      | Permissão |
| ------------------------- | --------- |
| Criar oferta              | SIM       |
| Editar oferta própria     | SIM       |
| Excluir oferta própria    | SIM       |
| Visualizar oferta própria | SIM       |

---

## Pedidos

| Ação                               | Permissão |
| ---------------------------------- | --------- |
| Visualizar pedidos da própria loja | SIM       |
| Alterar status da retirada         | SIM       |
| Visualizar pedidos de terceiros    | NÃO       |

---

## Documentos

| Ação                                 | Permissão |
| ------------------------------------ | --------- |
| Enviar documentos                    | SIM       |
| Visualizar documentos próprios       | SIM       |
| Editar documentos antes da aprovação | SIM       |
| Visualizar documentos de terceiros   | NÃO       |

---

# PERFIL: ADMIN

## Usuários

| Ação             | Permissão |
| ---------------- | --------- |
| Visualizar todos | SIM       |
| Editar todos     | SIM       |
| Bloquear usuário | SIM       |
| Excluir usuário  | SIM       |

---

## Lojistas

| Ação                          | Permissão |
| ----------------------------- | --------- |
| Aprovar cadastro              | SIM       |
| Rejeitar cadastro             | SIM       |
| Solicitar correção documental | SIM       |

---

## Produtos

| Ação             | Permissão |
| ---------------- | --------- |
| Visualizar todos | SIM       |
| Editar todos     | SIM       |
| Ocultar produto  | SIM       |

---

## Promoções

| Ação                       | Permissão |
| -------------------------- | --------- |
| Visualizar todas           | SIM       |
| Remover promoção irregular | SIM       |

---

## Vouchers

| Ação                      | Permissão |
| ------------------------- | --------- |
| Visualizar todos          | SIM       |
| Remover voucher irregular | SIM       |

---

## Ofertas Pagas

| Ação             | Permissão |
| ---------------- | --------- |
| Visualizar todas | SIM       |
| Suspender oferta | SIM       |

---

## Analytics

| Ação                        | Permissão |
| --------------------------- | --------- |
| Visualizar métricas globais | SIM       |
| Exportar relatórios         | SIM       |

---

# Buckets Supabase

## avatars

Consumidor:

* upload próprio

Lojista:

* upload próprio

Admin:

* acesso total

---

## produtos

Lojista:

* upload próprio

Admin:

* acesso total

---

## documentos

Lojista:

* upload próprio

Admin:

* acesso total

Consumidor:

* sem acesso

---

## vouchers

Lojista Premium:

* upload próprio

Admin:

* acesso total

---

## promocoes

Lojista:

* upload próprio

Admin:

* acesso total

---

Fim da versão 1.0
