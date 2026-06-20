# Decisões Técnicas - ShopXpert

## 1. Arquitetura Geral

O ShopXpert será estruturado como um monorepo, permitindo organizar em um único repositório o aplicativo mobile, o portal do lojista, o painel administrativo, pacotes compartilhados, documentação e integração com Supabase.

## 2. Aplicativo Mobile

O aplicativo mobile será desenvolvido com:

- React Native
- Expo
- TypeScript

Motivo: permite criar uma aplicação mobile moderna, com boa produtividade, suporte a Android e iOS e integração futura com recursos nativos como geolocalização, câmera, push notifications e QR Code.

## 3. Aplicações Web

As aplicações web serão desenvolvidas com:

- Next.js
- TypeScript
- Tailwind CSS

Serão criadas duas aplicações web principais:

- Portal do Lojista
- Painel Administrativo

## 4. Backend

O backend será baseado em:

- Supabase
- PostgreSQL
- Supabase Auth
- Supabase Storage
- Supabase Edge Functions

Motivo: o Supabase oferece autenticação, banco de dados, armazenamento de arquivos, funções serverless e políticas de segurança com RLS.

## 5. Separação de Perfis

O sistema terá três perfis principais:

- Consumidor
- Lojista
- Administrador

Cada perfil terá permissões e interfaces diferentes.

## 6. Design System

As cores principais da marca serão:

- Laranja: #F25022
- Verde: #007E33
- Branco: #FFFFFF
- Fundo leve: #FAFAFA
- Texto principal: #333333
- Texto secundário: #666666
- Borda: #CCCCCC

## 7. Organização dos Apps

A estrutura será:

- apps/mobile: app mobile do consumidor
- apps/web-lojista: portal do lojista
- apps/web-admin: painel administrativo
- packages/ui: componentes compartilhados
- packages/types: tipos compartilhados
- packages/services: serviços compartilhados
- packages/utils: funções utilitárias
- packages/constants: constantes globais

## 8. Estratégia de Desenvolvimento

O desenvolvimento será feito em etapas:

1. Configuração inicial do monorepo
2. Configuração dos apps
3. Criação do design system base
4. Criação das telas mockadas
5. Criação do banco Supabase
6. Integração com autenticação
7. Integração com dados reais
8. Implementação de pagamentos, vouchers e ofertas pagas

## 9. Decisão Importante

O Codex deve gerar primeiro a estrutura técnica inicial, sem tentar criar a aplicação completa de uma vez.

O desenvolvimento deve ser dividido por módulos:

- Base do projeto
- Mobile consumidor
- Portal lojista
- Painel admin
- Supabase
- Autenticação
- Vouchers
- Ofertas pagas
- Relatórios