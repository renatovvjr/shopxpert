# Governança e Perfis de Acesso - ShopXpert

## Objetivo

Definir oficialmente os tipos de usuários, regras de acesso, governança da plataforma e responsabilidades de cada perfil.

Este documento servirá como referência para:

* Supabase Auth
* RLS Policies
* Backend
* Frontend
* Painel Administrativo
* Codex
* Segurança da Plataforma

---

# PERFIS OFICIAIS

A plataforma ShopXpert possui três perfis principais:

1. ADMIN
2. CONSUMIDOR
3. LOJISTA

Todos os usuários autenticados deverão possuir um registro na tabela:

```txt
profiles
```

O campo:

```txt
tipo_usuario
```

deverá determinar o comportamento do sistema.

---

# PERFIL ADMIN

## Objetivo

Responsável pela operação e administração da plataforma.

Exemplos:

* Equipe ShopXpert
* Desenvolvedores autorizados
* Operações
* Suporte administrativo

---

## Forma de Cadastro

ADMIN não pode se cadastrar livremente.

A criação ou promoção para ADMIN deverá ocorrer apenas por outro ADMIN autorizado.

Exemplo:

```sql
update profiles
set tipo_usuario = 'ADMIN'
where email = 'admin@shopxpert.com';
```

---

## Permissões

Pode acessar:

* Todos os consumidores
* Todos os lojistas
* Todos os estabelecimentos
* Todos os produtos
* Todas as promoções
* Todos os vouchers
* Todas as ofertas pagas
* Todos os pedidos
* Todas as avaliações
* Todos os eventos analytics
* Todos os documentos enviados

Pode:

* Aprovar lojistas
* Reprovar lojistas
* Suspender lojistas
* Suspender usuários
* Excluir conteúdo inadequado
* Moderar avaliações
* Acessar relatórios

---

# PERFIL CONSUMIDOR

## Objetivo

Usuário final da plataforma.

Responsável por:

* Criar listas de compras
* Comparar preços
* Utilizar vouchers
* Comprar ofertas
* Avaliar estabelecimentos
* Favoritar produtos

---

## Forma de Cadastro

Cadastro livre.

Qualquer pessoa poderá criar uma conta.

Métodos previstos:

* Email e senha
* Google (futuro)
* Apple (futuro)

---

## Permissões

Pode acessar apenas:

* Próprio perfil
* Próprias listas
* Próprios comparativos
* Próprios pedidos
* Próprios favoritos
* Próprias avaliações
* Próprias notificações
* Próprias economias

Não pode acessar:

* Dados de outros consumidores
* Dados internos de lojistas
* Painel administrativo

---

# PERFIL LOJISTA

## Objetivo

Representar empresas e estabelecimentos comerciais.

Exemplos:

* Mercados
* Farmácias
* Padarias
* Açougues
* Pet Shops
* Conveniências

---

## Forma de Cadastro

Cadastro livre.

O lojista pode criar sua conta normalmente.

Entretanto, não poderá operar completamente até passar pela validação documental.

---

# FLUXO DE APROVAÇÃO

Cadastro

↓

Envio de documentos

↓

Análise administrativa

↓

Resultado

---

## Status Possíveis

PENDENTE

EM_ANALISE

APROVADO

REJEITADO

SUSPENSO

---

## Significado dos Status

### PENDENTE

Cadastro criado.

Documentação ainda não enviada.

---

### EM_ANALISE

Documentação enviada.

Aguardando validação.

---

### APROVADO

Lojista autorizado a utilizar a plataforma.

Pode:

* Criar estabelecimentos
* Criar produtos
* Criar promoções
* Criar vouchers
* Criar ofertas pagas

---

### REJEITADO

Documentação inválida.

Necessário reenviar documentos.

---

### SUSPENSO

Conta bloqueada temporariamente.

Não pode publicar conteúdo.

---

# PERMISSÕES DO LOJISTA

Pode acessar apenas:

* Próprio perfil
* Próprios documentos
* Próprios estabelecimentos
* Próprios produtos
* Próprios preços
* Próprias promoções
* Próprios vouchers
* Próprias ofertas pagas
* Próprios pedidos

Não pode acessar:

* Dados de outros lojistas
* Dados administrativos
* Informações privadas de consumidores

---

# MODELO DE GOVERNANÇA

```txt
Auth User
    │
    ▼
Profiles
    │
    ├── ADMIN
    │
    ├── CONSUMIDOR
    │
    └── LOJISTA
            │
            └── Status de Validação
```

---

# REGRAS DE SEGURANÇA

Todos os acessos devem utilizar:

* Supabase Auth
* JWT
* Row Level Security (RLS)

Nenhuma consulta deverá confiar apenas em dados enviados pelo frontend.

Todas as permissões deverão ser validadas pelo banco.

---

# RLS

O arquivo:

```txt
supabase/migrations/002_rls.sql
```

deverá implementar as regras definidas neste documento.

---

# DECISÃO OFICIAL

ADMIN
→ Criado apenas por outro ADMIN.

CONSUMIDOR
→ Cadastro livre.

LOJISTA
→ Cadastro livre com validação documental obrigatória.

---

# STATUS

Documento oficial de governança e perfis do ShopXpert.

Versão 1.0
