-- =========================================================
-- ShopXpert - 003_storage_policies.sql
-- Supabase Storage Policies
-- Versão: 1.0
-- Objetivo: configurar políticas de acesso aos buckets
-- Buckets:
-- avatars, produtos, estabelecimentos, documentos, promocoes, vouchers
-- =========================================================

-- IMPORTANTE:
-- Este arquivo assume que os buckets já foram criados no painel Supabase:
-- avatars           -> público recomendado
-- produtos          -> público
-- estabelecimentos  -> público
-- documentos        -> privado
-- promocoes         -> público
-- vouchers          -> público

-- =========================================================
-- HELPER FUNCTIONS
-- =========================================================

create or replace function public.storage_foldername(name text)
returns text
language sql
stable
as $$
  select split_part(name, '/', 1);
$$;

-- =========================================================
-- AVATARS
-- Público para leitura.
-- Upload/update/delete apenas do próprio usuário ou admin.
-- Caminho recomendado:
-- avatars/{profile_id}/arquivo.png
-- =========================================================

create policy "avatars_public_read"
on storage.objects for select
using (bucket_id = 'avatars');

create policy "avatars_insert_own_or_admin"
on storage.objects for insert
with check (
  bucket_id = 'avatars'
  and (
    public.is_admin()
    or public.storage_foldername(name) = auth.uid()::text
  )
);

create policy "avatars_update_own_or_admin"
on storage.objects for update
using (
  bucket_id = 'avatars'
  and (
    public.is_admin()
    or public.storage_foldername(name) = auth.uid()::text
  )
)
with check (
  bucket_id = 'avatars'
  and (
    public.is_admin()
    or public.storage_foldername(name) = auth.uid()::text
  )
);

create policy "avatars_delete_own_or_admin"
on storage.objects for delete
using (
  bucket_id = 'avatars'
  and (
    public.is_admin()
    or public.storage_foldername(name) = auth.uid()::text
  )
);

-- =========================================================
-- PRODUTOS
-- Público para leitura.
-- Upload/update/delete por lojistas aprovados ou admin.
-- Caminho recomendado:
-- produtos/{estabelecimento_id}/arquivo.png
-- =========================================================

create policy "produtos_public_read"
on storage.objects for select
using (bucket_id = 'produtos');

create policy "produtos_insert_merchant_or_admin"
on storage.objects for insert
with check (
  bucket_id = 'produtos'
  and (
    public.is_admin()
    or (
      public.is_lojista_aprovado()
      and public.owns_estabelecimento(public.storage_foldername(name)::uuid)
    )
  )
);

create policy "produtos_update_merchant_or_admin"
on storage.objects for update
using (
  bucket_id = 'produtos'
  and (
    public.is_admin()
    or public.owns_estabelecimento(public.storage_foldername(name)::uuid)
  )
)
with check (
  bucket_id = 'produtos'
  and (
    public.is_admin()
    or public.owns_estabelecimento(public.storage_foldername(name)::uuid)
  )
);

create policy "produtos_delete_merchant_or_admin"
on storage.objects for delete
using (
  bucket_id = 'produtos'
  and (
    public.is_admin()
    or public.owns_estabelecimento(public.storage_foldername(name)::uuid)
  )
);

-- =========================================================
-- ESTABELECIMENTOS
-- Público para leitura.
-- Upload/update/delete por lojistas aprovados donos da loja ou admin.
-- Caminho recomendado:
-- estabelecimentos/{estabelecimento_id}/arquivo.png
-- =========================================================

create policy "estabelecimentos_public_read"
on storage.objects for select
using (bucket_id = 'estabelecimentos');

create policy "estabelecimentos_insert_owner_or_admin"
on storage.objects for insert
with check (
  bucket_id = 'estabelecimentos'
  and (
    public.is_admin()
    or (
      public.is_lojista_aprovado()
      and public.owns_estabelecimento(public.storage_foldername(name)::uuid)
    )
  )
);

create policy "estabelecimentos_update_owner_or_admin"
on storage.objects for update
using (
  bucket_id = 'estabelecimentos'
  and (
    public.is_admin()
    or public.owns_estabelecimento(public.storage_foldername(name)::uuid)
  )
)
with check (
  bucket_id = 'estabelecimentos'
  and (
    public.is_admin()
    or public.owns_estabelecimento(public.storage_foldername(name)::uuid)
  )
);

create policy "estabelecimentos_delete_owner_or_admin"
on storage.objects for delete
using (
  bucket_id = 'estabelecimentos'
  and (
    public.is_admin()
    or public.owns_estabelecimento(public.storage_foldername(name)::uuid)
  )
);

-- =========================================================
-- DOCUMENTOS
-- Privado.
-- Leitura pelo lojista dono ou admin.
-- Upload pelo lojista dono ou admin.
-- Caminho recomendado:
-- documentos/{lojista_id}/arquivo.pdf
-- =========================================================

create policy "documentos_select_owner_or_admin"
on storage.objects for select
using (
  bucket_id = 'documentos'
  and (
    public.is_admin()
    or exists (
      select 1
      from public.lojistas l
      where l.id::text = public.storage_foldername(name)
        and l.profile_id = auth.uid()
    )
  )
);

create policy "documentos_insert_owner_or_admin"
on storage.objects for insert
with check (
  bucket_id = 'documentos'
  and (
    public.is_admin()
    or exists (
      select 1
      from public.lojistas l
      where l.id::text = public.storage_foldername(name)
        and l.profile_id = auth.uid()
    )
  )
);

create policy "documentos_update_owner_or_admin"
on storage.objects for update
using (
  bucket_id = 'documentos'
  and (
    public.is_admin()
    or exists (
      select 1
      from public.lojistas l
      where l.id::text = public.storage_foldername(name)
        and l.profile_id = auth.uid()
    )
  )
)
with check (
  bucket_id = 'documentos'
  and (
    public.is_admin()
    or exists (
      select 1
      from public.lojistas l
      where l.id::text = public.storage_foldername(name)
        and l.profile_id = auth.uid()
    )
  )
);

create policy "documentos_delete_owner_or_admin"
on storage.objects for delete
using (
  bucket_id = 'documentos'
  and (
    public.is_admin()
    or exists (
      select 1
      from public.lojistas l
      where l.id::text = public.storage_foldername(name)
        and l.profile_id = auth.uid()
    )
  )
);

-- =========================================================
-- PROMOÇÕES
-- Público para leitura.
-- Upload/update/delete por lojistas aprovados donos da loja ou admin.
-- Caminho recomendado:
-- promocoes/{estabelecimento_id}/arquivo.png
-- =========================================================

create policy "promocoes_public_read"
on storage.objects for select
using (bucket_id = 'promocoes');

create policy "promocoes_insert_owner_or_admin"
on storage.objects for insert
with check (
  bucket_id = 'promocoes'
  and (
    public.is_admin()
    or (
      public.is_lojista_aprovado()
      and public.owns_estabelecimento(public.storage_foldername(name)::uuid)
    )
  )
);

create policy "promocoes_update_owner_or_admin"
on storage.objects for update
using (
  bucket_id = 'promocoes'
  and (
    public.is_admin()
    or public.owns_estabelecimento(public.storage_foldername(name)::uuid)
  )
)
with check (
  bucket_id = 'promocoes'
  and (
    public.is_admin()
    or public.owns_estabelecimento(public.storage_foldername(name)::uuid)
  )
);

create policy "promocoes_delete_owner_or_admin"
on storage.objects for delete
using (
  bucket_id = 'promocoes'
  and (
    public.is_admin()
    or public.owns_estabelecimento(public.storage_foldername(name)::uuid)
  )
);

-- =========================================================
-- VOUCHERS
-- Público para leitura.
-- Upload/update/delete por lojistas premium donos da loja ou admin.
-- Caminho recomendado:
-- vouchers/{estabelecimento_id}/arquivo.png
-- =========================================================

create policy "vouchers_public_read"
on storage.objects for select
using (bucket_id = 'vouchers');

create policy "vouchers_insert_owner_premium_or_admin"
on storage.objects for insert
with check (
  bucket_id = 'vouchers'
  and (
    public.is_admin()
    or (
      public.owns_estabelecimento(public.storage_foldername(name)::uuid)
      and exists (
        select 1
        from public.lojistas l
        where l.id = public.current_lojista_id()
          and l.status_validacao = 'aprovado'
          and l.premium_ativo = true
      )
    )
  )
);

create policy "vouchers_update_owner_premium_or_admin"
on storage.objects for update
using (
  bucket_id = 'vouchers'
  and (
    public.is_admin()
    or (
      public.owns_estabelecimento(public.storage_foldername(name)::uuid)
      and exists (
        select 1
        from public.lojistas l
        where l.id = public.current_lojista_id()
          and l.status_validacao = 'aprovado'
          and l.premium_ativo = true
      )
    )
  )
)
with check (
  bucket_id = 'vouchers'
  and (
    public.is_admin()
    or (
      public.owns_estabelecimento(public.storage_foldername(name)::uuid)
      and exists (
        select 1
        from public.lojistas l
        where l.id = public.current_lojista_id()
          and l.status_validacao = 'aprovado'
          and l.premium_ativo = true
      )
    )
  )
);

create policy "vouchers_delete_owner_premium_or_admin"
on storage.objects for delete
using (
  bucket_id = 'vouchers'
  and (
    public.is_admin()
    or (
      public.owns_estabelecimento(public.storage_foldername(name)::uuid)
      and exists (
        select 1
        from public.lojistas l
        where l.id = public.current_lojista_id()
          and l.status_validacao = 'aprovado'
          and l.premium_ativo = true
      )
    )
  )
);

-- =========================================================
-- END
-- =========================================================
