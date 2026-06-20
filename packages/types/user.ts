export type UserRole = 'CONSUMIDOR' | 'LOJISTA' | 'ADMIN';

export interface Profile {
  id: string;
  nome: string;
  email?: string;
  telefone?: string;
  tipoUsuario: UserRole;
  avatarUrl?: string;
  ativo: boolean;
  createdAt: string;
}
