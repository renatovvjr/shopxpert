export interface Product {
  id: string;
  estabelecimentoId: string;
  categoriaId?: string;
  nome: string;
  codigo?: string;
  descricao?: string;
  imagemUrl?: string;
  ativo: boolean;
}

export interface ProductPrice {
  id: string;
  produtoId: string;
  preco: number;
  dataAtualizacao: string;
}
