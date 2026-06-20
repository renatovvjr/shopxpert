# 33 - API CONTRACTS

## Objetivo

Definir contratos oficiais das principais operações do sistema.

---

# AUTH

## Cadastro

Input

```json
{
  "nome": "string",
  "email": "string",
  "senha": "string"
}
```

Output

```json
{
  "success": true
}
```

---

## Login

Input

```json
{
  "email": "string",
  "senha": "string"
}
```

Output

```json
{
  "token": "jwt"
}
```

---

# LISTAS

## Criar Lista

Input

```json
{
  "nome": "string"
}
```

Output

```json
{
  "id": "uuid"
}
```

---

## Adicionar Item

Input

```json
{
  "lista_id": "uuid",
  "produto_id": "uuid",
  "quantidade": 1
}
```

Output

```json
{
  "success": true
}
```

---

# COMPARATIVOS

## Gerar Comparativo

Input

```json
{
  "lista_id": "uuid"
}
```

Output

```json
{
  "economia": 25.90,
  "melhor_estabelecimento": "uuid"
}
```

---

# FAVORITOS

## Favoritar Produto

Input

```json
{
  "produto_id": "uuid"
}
```

Output

```json
{
  "success": true
}
```

---

# LOJISTA

## Solicitar Aprovação

Input

```json
{
  "nome_responsavel": "string",
  "cnpj": "string"
}
```

Output

```json
{
  "status": "pendente"
}
```

---

# ESTABELECIMENTOS

## Criar Estabelecimento

Input

```json
{
  "nome": "string",
  "cidade": "string",
  "estado": "string"
}
```

Output

```json
{
  "id": "uuid"
}
```

---

# PRODUTOS

## Atualizar Preço

Input

```json
{
  "produto_id": "uuid",
  "preco": 9.99
}
```

Output

```json
{
  "success": true
}
```

---

# ERROS PADRÃO

400

Dados inválidos.

---

401

Não autenticado.

---

403

Sem permissão.

---

404

Registro não encontrado.

---

500

Erro interno.

---

# REGRA FINAL

Todo endpoint deve possuir:

* Input definido
* Output definido
* Tratamento de erros
* Tipagem TypeScript

---

Versão 1.0
