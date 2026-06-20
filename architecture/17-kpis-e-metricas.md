# KPIs e Métricas - ShopXpert

## Objetivo

Definir os principais indicadores que deverão ser acompanhados no ShopXpert desde o MVP.

Este documento será usado como referência para:

- Dashboard Administrativo
- Dashboard do Lojista
- Relatórios
- Analytics
- Supabase
- Codex
- Validação do MVP

---

# MÉTRICAS GERAIS DO MVP

## Usuários

- Total de consumidores cadastrados
- Total de lojistas cadastrados
- Total de lojistas aprovados
- Total de usuários ativos
- Novos usuários por semana
- Novos lojistas por semana

---

## Engajamento

- Quantidade de buscas realizadas
- Quantidade de listas criadas
- Quantidade de comparativos realizados
- Quantidade de promoções visualizadas
- Quantidade de vouchers visualizados
- Quantidade de ofertas pagas visualizadas

---

## Conversão

- Conversão de visitante para cadastro
- Conversão de consumidor gratuito para premium
- Conversão de lojista gratuito para premium
- Conversão de visualização de oferta para compra
- Conversão de voucher visualizado para voucher utilizado

---

# MÉTRICAS DO CONSUMIDOR

## Economia

- Economia média por consumidor
- Economia total gerada pela plataforma
- Economia por lista de compras
- Economia por região
- Economia por estabelecimento

---

## Listas de Compras

- Total de listas criadas
- Média de itens por lista
- Produtos mais adicionados
- Categorias mais adicionadas
- Listas com maior economia

---

## Vouchers

- Vouchers disponíveis
- Vouchers resgatados
- Vouchers utilizados
- Vouchers expirados
- Taxa de uso de vouchers

---

## Ofertas Pagas

- Ofertas compradas
- Pedidos aguardando retirada
- Pedidos retirados
- Pedidos cancelados
- Pedidos expirados

---

# MÉTRICAS DO LOJISTA

## Cadastro e Aprovação

- Lojistas pendentes
- Lojistas em análise
- Lojistas aprovados
- Lojistas recusados
- Tempo médio de aprovação

---

## Produtos

- Produtos cadastrados
- Produtos ativos
- Produtos inativos
- Produtos mais visualizados
- Produtos mais buscados

---

## Promoções

- Promoções ativas
- Promoções expiradas
- Promoções mais visualizadas
- Cliques em promoções
- Taxa de conversão de promoções

---

## Vouchers

- Vouchers criados
- Vouchers ativos
- Vouchers utilizados
- Taxa de utilização de vouchers
- Receita gerada por vouchers

---

## Ofertas Pagas

- Ofertas criadas
- Ofertas ativas
- Ofertas vendidas
- Receita bruta
- Receita líquida
- Comissão da plataforma

---

# MÉTRICAS FINANCEIRAS

## Receita Recorrente

- MRR Consumidor
- MRR Lojista
- MRR Total

---

## Receita Transacional

- Total vendido em ofertas pagas
- Comissão total da plataforma
- Ticket médio por pedido
- Repasse estimado aos lojistas

---

## Assinaturas

- Assinaturas ativas
- Assinaturas canceladas
- Novas assinaturas
- Churn
- LTV estimado

---

# MÉTRICAS ADMINISTRATIVAS

## Operação

- Documentos pendentes de análise
- Lojistas aguardando aprovação
- Produtos denunciados
- Promoções denunciadas
- Avaliações denunciadas

---

## Qualidade

- Nota média dos estabelecimentos
- Reclamações por estabelecimento
- Tempo médio de resposta
- Percentual de lojistas ativos

---

# EVENTOS ANALYTICS

O sistema deverá registrar os seguintes eventos:

## Consumidor

- cadastro_consumidor
- login_consumidor
- busca_produto
- criar_lista
- adicionar_item_lista
- comparar_precos
- visualizar_promocao
- favoritar_promocao
- visualizar_voucher
- utilizar_voucher
- visualizar_oferta_paga
- comprar_oferta_paga
- confirmar_retirada
- avaliar_estabelecimento

---

## Lojista

- cadastro_lojista
- envio_documento
- login_lojista
- criar_produto
- editar_produto
- criar_promocao
- criar_voucher
- criar_oferta_paga
- confirmar_retirada
- visualizar_relatorio

---

## Admin

- login_admin
- aprovar_lojista
- recusar_lojista
- validar_documento
- bloquear_usuario
- remover_promocao
- remover_voucher

---

# DASHBOARD ADMIN - MVP

O painel administrativo deve mostrar inicialmente:

1. Consumidores cadastrados
2. Lojistas cadastrados
3. Lojistas pendentes
4. Produtos cadastrados
5. Promoções ativas
6. Vouchers ativos
7. Ofertas pagas ativas
8. Pedidos aguardando retirada
9. Receita total estimada
10. Economia total gerada

---

# DASHBOARD LOJISTA - MVP

O painel do lojista deve mostrar:

1. Produtos cadastrados
2. Promoções ativas
3. Vouchers ativos
4. Ofertas pagas ativas
5. Visualizações de produtos
6. Cliques em promoções
7. Pedidos aguardando retirada
8. Receita estimada

---

# PRINCÍPIO

O ShopXpert deve medir desde o início:

- Aquisição
- Ativação
- Retenção
- Receita
- Engajamento

Essas métricas serão fundamentais para validar o negócio.

---

Fim da versão 1.0