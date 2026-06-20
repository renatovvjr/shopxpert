# API Specification Inicial

## Auth

- POST /auth/register-consumer
- POST /auth/register-store-owner
- POST /auth/login
- POST /auth/logout

## Consumer

- GET /consumer/home
- GET /consumer/products/search
- POST /consumer/shopping-lists
- GET /consumer/shopping-lists
- POST /consumer/paid-offers/:id/buy
- GET /consumer/orders
- POST /consumer/reviews

## Store Owner

- GET /merchant/dashboard
- POST /merchant/products
- PUT /merchant/products/:id
- POST /merchant/promotions
- POST /merchant/vouchers
- GET /merchant/reports
- POST /merchant/documents

## Admin

- GET /admin/pending-merchants
- PUT /admin/merchants/:id/approve
- PUT /admin/merchants/:id/reject
- GET /admin/reports
