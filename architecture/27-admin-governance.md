# Governança Administrativa - ShopXpert

## Objetivo

Definir responsabilidades administrativas da plataforma.

---

# Tipos de Usuários

## Consumidor

Permissões:

* Utilizar a plataforma
* Comparar preços
* Utilizar vouchers
* Criar listas
* Avaliar estabelecimentos

---

## Lojista

Permissões:

* Gerenciar estabelecimentos
* Gerenciar produtos
* Atualizar preços
* Criar promoções
* Gerenciar assinatura premium

---

## Administrador

Permissões totais.

---

# Responsabilidades do Administrador

## Usuários

Pode:

* Ativar usuários
* Bloquear usuários
* Reativar usuários

---

## Lojistas

Pode:

* Aprovar
* Rejeitar
* Suspender

---

## Estabelecimentos

Pode:

* Aprovar
* Suspender
* Remover

---

## Conteúdo

Pode:

* Remover avaliações abusivas
* Remover promoções fraudulentas
* Remover vouchers inválidos

---

## Assinaturas

Pode:

* Ativar premium
* Cancelar premium
* Corrigir pagamentos

---

# Criação de Administradores

Administradores não podem ser criados pelo aplicativo.

Administradores são promovidos manualmente.

Função utilizada:

```sql
select public.promover_admin('email@dominio.com');
```

---

# Auditoria

Toda ação administrativa deverá gerar registro em:

```txt
eventos_analytics
```

---

Versão 1.0
