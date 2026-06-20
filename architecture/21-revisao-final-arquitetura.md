# Revisão Final da Arquitetura - ShopXpert

## Objetivo

Este documento registra os ajustes finais de arquitetura antes da criação das migrations SQL, políticas RLS, Edge Functions e execução do Codex.

As melhorias aqui descritas foram adicionadas para aumentar:

- escalabilidade
- retenção de usuários
- qualidade da comparação de preços
- inteligência de dados
- capacidade futura de notificações
- monetização
- percepção de valor pelo consumidor

---

# MELHORIA 01 - Produto Mestre e Produto Estabelecimento

## Problema identificado

Na modelagem inicial, cada estabelecimento teria seus próprios produtos cadastrados diretamente.

Isso causaria duplicação de produtos.

Exemplo:

- Arroz Tio João 5kg - Mercado A
- Arroz Tio João 5kg - Mercado B
- Arroz Tio João 5kg - Mercado C

Esse modelo dificulta a comparação correta de preços.

---

## Solução adotada

Separar o produto em duas entidades:

## produtos_mestre

Representa o produto único da plataforma.

Exemplo:

- Arroz Tio João 5kg

## produtos_estabelecimento

Representa o produto vendido por um estabelecimento específico.

Exemplo:

- Arroz Tio João 5kg no Mercado A

---

## Benefícios

- comparação de preços mais precisa
- suporte futuro a código de barras
- melhor busca
- melhor organização dos dados
- melhor performance
- integração futura com ERP e PDV

---

# MELHORIA 02 - Favoritos

## Nova tabela

favoritos

## Objetivo

Permitir que consumidores salvem produtos, promoções ou estabelecimentos de interesse.

---

## Campos sugeridos

- id
- consumidor_id
- produto_mestre_id
- estabelecimento_id
- promocao_id
- tipo_favorito
- created_at
- updated_at

---

## Tipos de favorito

- produto
- estabelecimento
- promocao

---

## Relacionamentos

consumidores (1) → (N) favoritos

produtos_mestre (1) → (N) favoritos

estabelecimentos (1) → (N) favoritos

promocoes (1) → (N) favoritos

---

## Benefícios

- usuários retornam ao app com mais frequência
- base para alertas de preço
- base para notificações inteligentes
- melhora da personalização futura
- aumento de retenção

---

# MELHORIA 03 - Economia do Usuário

## Nova tabela

economias_usuario

## Objetivo

Registrar quanto o consumidor economizou ao usar comparativos, vouchers ou ofertas pagas.

---

## Campos sugeridos

- id
- consumidor_id
- lista_id
- pedido_id
- voucher_id
- valor_estimado_sem_shopxpert
- valor_pago_ou_estimado
- economia_gerada
- origem
- created_at
- updated_at

---

## Origens possíveis

- comparativo
- voucher
- oferta_paga
- promocao

---

## Relacionamentos

consumidores (1) → (N) economias_usuario

listas_compras (1) → (N) economias_usuario

pedidos (1) → (N) economias_usuario

vouchers (1) → (N) economias_usuario

---

## Benefícios

Permite mostrar na Home:

"Você já economizou R$ 327,80 usando o ShopXpert."

Também permite relatórios como:

- economia mensal
- economia por lista
- economia por estabelecimento
- economia por categoria
- economia total da plataforma

---

# MELHORIA 04 - Histórico de Alteração de Preços

## Nova tabela

historico_precos

## Objetivo

Registrar alterações de preços realizadas por lojistas ou integrações.

Embora a tabela precos já guarde histórico de valores, a tabela historico_precos será usada para auditoria e rastreabilidade.

---

## Campos sugeridos

- id
- produto_estabelecimento_id
- preco_anterior
- preco_novo
- alterado_por
- origem_alteracao
- created_at

---

## Origens possíveis

- manual_lojista
- api
- admin
- importacao

---

## Relacionamentos

produtos_estabelecimento (1) → (N) historico_precos

profiles (1) → (N) historico_precos

---

## Benefícios

- auditoria
- transparência
- análise de variação de preços
- detecção de comportamento suspeito
- base futura para gráficos de tendência

---

# IMPACTO NO BANCO DE DADOS

As seguintes tabelas devem ser adicionadas ao schema final:

1. favoritos
2. economias_usuario
3. historico_precos

---

# IMPACTO NO DOCUMENTO 19

O arquivo:

architecture/19-supabase-schema-final.md

deve ser atualizado para incluir:

## favoritos

Campos:

- id
- consumidor_id
- produto_mestre_id
- estabelecimento_id
- promocao_id
- tipo_favorito

---

## economias_usuario

Campos:

- id
- consumidor_id
- lista_id
- pedido_id
- voucher_id
- valor_estimado_sem_shopxpert
- valor_pago_ou_estimado
- economia_gerada
- origem

---

## historico_precos

Campos:

- id
- produto_estabelecimento_id
- preco_anterior
- preco_novo
- alterado_por
- origem_alteracao

---

# IMPACTO NO DOCUMENTO 18

O arquivo:

architecture/18-entity-relationship-model.md

deve considerar os seguintes relacionamentos adicionais:

consumidores (1) → (N) favoritos

consumidores (1) → (N) economias_usuario

produtos_mestre (1) → (N) favoritos

estabelecimentos (1) → (N) favoritos

promocoes (1) → (N) favoritos

produtos_estabelecimento (1) → (N) historico_precos

profiles (1) → (N) historico_precos

---

# IMPACTO NA UX

## Favoritos

Adicionar futuramente:

- botão favoritar produto
- botão favoritar promoção
- tela de favoritos

---

## Economia do Usuário

Adicionar na Home:

- card de economia acumulada
- histórico mensal de economia
- economia por lista

---

## Histórico de Preços

Adicionar futuramente:

- gráfico de evolução de preço
- alerta de queda de preço
- tendência de preço

---

# IMPACTO NO MVP

## Entra no MVP

- economias_usuario
- favoritos básico
- historico_precos básico

---

## Não entra no MVP visual completo

- gráfico avançado de tendência
- alerta automático de queda de preço
- recomendação inteligente

---

# DECISÃO FINAL

As três melhorias devem ser incluídas na estrutura do banco desde o início.

Motivo:

É mais barato criar essas tabelas agora do que alterar o banco depois que o app já estiver integrado ao Supabase.

---

# CONCLUSÃO

A arquitetura final do ShopXpert passa a considerar:

- produtos_mestre
- produtos_estabelecimento
- favoritos
- economias_usuario
- historico_precos

Essa estrutura deixa o produto mais preparado para:

- comparação real de preços
- retenção
- gamificação futura
- alertas inteligentes
- dashboards mais ricos
- expansão nacional

---

Fim da versão 1.0