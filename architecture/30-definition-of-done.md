# 30 - DEFINITION OF DONE (DoD)

## Objetivo

Definir quando uma funcionalidade pode ser considerada concluída no projeto ShopXpert.

Nenhuma entrega deve ser considerada finalizada sem atender todos os critérios deste documento.

---

# PRINCÍPIO GERAL

Uma funcionalidade só está pronta quando:

* funciona
* foi validada
* respeita a arquitetura
* respeita segurança
* respeita UX
* respeita performance

---

# CRITÉRIOS OBRIGATÓRIOS

Toda feature deve atender:

## Código

* Compila sem erros
* Sem erros TypeScript
* Sem warnings críticos
* Sem código morto
* Sem duplicação desnecessária

---

## Arquitetura

* Respeita documentação da pasta architecture
* Respeita modelo de domínio
* Respeita permissões
* Respeita governança

---

## Banco de Dados

* Utiliza tabelas existentes
* Utiliza relacionamentos existentes
* Não cria colunas não documentadas
* Não altera migrations já aprovadas

---

## Segurança

* Respeita RLS
* Respeita Auth
* Respeita perfis de usuário
* Não expõe dados indevidamente

---

## UX

* Fluxo intuitivo
* Navegação clara
* Feedback visual adequado
* Tratamento de erros amigável

---

## Responsividade

Funciona corretamente em:

* Mobile
* Tablet
* Desktop

---

## Estados Obrigatórios

Toda tela deve possuir:

### Loading State

Exibir carregamento adequado.

---

### Empty State

Exibir estado vazio amigável.

---

### Error State

Exibir mensagem clara para o usuário.

---

### Success State

Exibir confirmação de sucesso.

---

# FORMULÁRIOS

Todo formulário deve possuir:

* validação
* mensagens de erro
* prevenção de duplicidade
* loading durante envio

---

# LISTAGENS

Toda listagem deve possuir:

* loading
* empty state
* paginação quando necessário
* busca quando aplicável

---

# COMPONENTES

Todo componente deve:

* ser reutilizável
* possuir tipagem
* possuir documentação básica

---

# APIs

Toda integração deve:

* tratar erros
* validar dados
* retornar respostas consistentes

---

# MOBILE

Toda funcionalidade mobile deve:

* funcionar offline quando possível
* tratar conexão instável
* respeitar navegação nativa

---

# PAINEL ADMIN

Toda funcionalidade administrativa deve:

* registrar auditoria
* respeitar permissões
* confirmar ações destrutivas

---

# TESTES MANUAIS

Antes da conclusão:

Validar cenário feliz.

Validar cenário de erro.

Validar cenário sem dados.

Validar cenário de permissão insuficiente.

---

# CHECKLIST DE ENTREGA

Antes de marcar como concluído:

[ ] Sem erros TypeScript

[ ] Sem erros de build

[ ] RLS validado

[ ] Responsivo

[ ] Loading state

[ ] Empty state

[ ] Error state

[ ] Success state

[ ] Fluxo validado

[ ] Permissões validadas

[ ] Documentação atualizada

---

# REGRA FINAL

Concluído não significa apenas implementado.

Concluído significa:

Implementado + Validado + Seguro + Usável.

---

Versão 1.0
