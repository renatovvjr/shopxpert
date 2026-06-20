# Prompt Supabase - Banco de Dados

Crie migrations SQL para o Supabase com as tabelas descritas em `architecture/02-database-model.md`.

## Requisitos

- Usar UUID como chave primária.
- Criar created_at e updated_at.
- Criar foreign keys.
- Criar indexes para busca e relacionamento.
- Preparar RLS para consumidor, lojista e admin.
- Preparar storage buckets:
  - avatars
  - produtos
  - lojistas
  - documentos
  - vouchers
  - promocoes
