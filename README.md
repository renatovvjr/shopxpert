# ShopXpert

Plataforma web e mobile para comparação de preços, listas inteligentes de compras, promoções, vouchers, ofertas pagas, planos premium e gestão de lojistas.

## Visão do Produto

O ShopXpert conecta consumidores e estabelecimentos comerciais, permitindo:

- Consumidores compararem preços por região.
- Criarem listas de compras inteligentes.
- Acessarem promoções, cupons e vouchers.
- Comprarem ofertas pagas com desconto e retirada na loja.
- Lojistas gerenciarem produtos, preços, promoções e vouchers.
- Administradores validarem lojistas, documentos, planos e conteúdo da plataforma.

## Módulos do Sistema

### 1. Mobile Consumidor
Local: `apps/mobile`

Fluxos principais:
- Seleção de perfil.
- Boas-vindas.
- Cadastro e login.
- Home.
- Lista de compras.
- Comparativo de estabelecimentos.
- Promoções e cupons.
- Plano premium.
- Histórico de vouchers.
- Ofertas pagas.
- Pedido confirmado.
- Meus pedidos.
- Avaliação de estabelecimentos.

### 2. Web Lojista
Local: `apps/web-lojista`

Fluxos principais:
- Boas-vindas lojista.
- Cadastro com validação GOV.BR ou envio de documentos.
- Dashboard.
- Produtos.
- Promoções.
- Relatórios.
- Perfil da loja.
- Plano premium.
- Gestão de vouchers.

### 3. Web Admin
Local: `apps/web-admin`

Fluxos principais:
- Login administrativo.
- Aprovação de lojistas.
- Validação de documentos.
- Gestão de usuários.
- Gestão de produtos, promoções e vouchers.
- Relatórios gerais.
- Configurações da plataforma.

## Paleta de Cores

- Laranja principal: `#F25022`
- Verde principal: `#007E33`
- Branco: `#FFFFFF`
- Off-white: `#FAFAFA`
- Texto primário: `#333333`
- Texto secundário: `#666666`
- Placeholder: `#999999`
- Borda leve: `#CCCCCC`

## Antes de usar o Codex

1. Conferir os documentos em `docs/`.
2. Conferir arquitetura em `architecture/`.
3. Conferir prompts em `prompts/`.
4. Ajustar nomes, regras e escopo caso necessário.
5. Depois pedir ao Codex para gerar a base técnica.

## Stack Recomendada

- Mobile: React Native + Expo + TypeScript.
- Web Lojista/Admin: Next.js + TypeScript + Tailwind CSS.
- Backend: Supabase.
- Banco: PostgreSQL.
- Autenticação: Supabase Auth.
- Storage: Supabase Storage.
- Functions: Supabase Edge Functions.

## Status Atual

Estrutura inicial criada para organização do projeto e preparação para geração de código com Codex.
