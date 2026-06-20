export type OrderStatus = 'aguardando_retirada' | 'retirado' | 'cancelado' | 'expirado';

export interface Order {
  id: string;
  consumidorId: string;
  ofertaPagaId: string;
  estabelecimentoId: string;
  codigoRetirada: string;
  status: OrderStatus;
  valorPago: number;
  createdAt: string;
}
