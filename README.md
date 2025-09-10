# Projeto de Análise de Dados com Hive - Olist

Este projeto demonstra uma análise de dados utilizando o Apache Hive em um cluster Google Dataproc, com dados armazenados no Google Cloud Storage (GCS).  
O objetivo foi explorar o dataset da Olist e responder perguntas analíticas relevantes para entender clientes, pedidos, pagamentos, vendedores e produtos.

---

## 1. Visão Geral do Projeto

- Tecnologias utilizadas:  
  - Google Cloud Dataproc (Cluster Hadoop + Hive)  
  - Google Cloud Storage (GCS)  
  - Apache Hive + Beeline  
  - SQL para consultas analíticas  

- Etapas do trabalho:  
  1. Conexão ao Hive via Beeline  
  2. Criação do database `olist`  
  3. Criação das tabelas externas a partir dos arquivos CSV no GCS  
  4. Execução de consultas analíticas  
  5. Documentação e proposta de evolução  

---

## 2. Esquema de Dados

As tabelas implementadas no Hive foram baseadas no dataset público da Olist.  

### **Tabela: customers**
- `customer_id` (string) → Identificador único do cliente  
- `customer_unique_id` (string) → ID único por cliente  
- `customer_zip_code_prefix` (string) → CEP do cliente  
- `customer_city` (string) → Cidade do cliente  
- `customer_state` (string) → Estado do cliente  

### **Tabela: orders**
- `order_id` (string) → Identificador do pedido  
- `customer_id` (string) → Chave estrangeira para `customers`  
- `order_status` (string) → Status do pedido  
- `order_purchase_timestamp` (timestamp) → Data de compra  
- `order_approved_at` (timestamp) → Data de aprovação do pagamento  
- `order_delivered_carrier_date` (timestamp) → Data em que o pedido foi postado pela transportadora  
- `order_delivered_customer_date` (timestamp) → Data de entrega ao cliente  
- `order_estimated_delivery_date` (timestamp) → Data estimada de entrega  

### **Tabela: order_items**
- `order_id` (string) → Identificador do pedido  
- `order_item_id` (int) → Sequência do item no pedido  
- `product_id` (string) → Identificador do produto  
- `seller_id` (string) → Identificador do vendedor  
- `shipping_limit_date` (timestamp) → Data limite de envio  
- `price` (double) → Preço do item  
- `freight_value` (double) → Valor do frete  

### **Tabela: order_payments**
- `order_id` (string) → Identificador do pedido  
- `payment_sequential` (int) → Sequência do pagamento no pedido  
- `payment_type` (string) → Tipo de pagamento (ex.: cartão, boleto)  
- `payment_installments` (int) → Número de parcelas  
- `payment_value` (double) → Valor pago  

### **Tabela: order_reviews**
- `review_id` (string) → Identificador da avaliação  
- `order_id` (string) → Pedido avaliado  
- `review_score` (int) → Nota da avaliação (1 a 5)  
- `review_comment_title` (string) → Título do comentário  
- `review_comment_message` (string) → Mensagem da avaliação  
- `review_creation_date` (timestamp) → Data da criação da avaliação  
- `review_answer_timestamp` (timestamp) → Data da resposta à avaliação  

### **Tabela: products**
- `product_id` (string) → Identificador único do produto  
- `product_category_name` (string) → Categoria do produto  
- `product_name_length` (int) → Tamanho do nome do produto  
- `product_description_length` (int) → Tamanho da descrição  
- `product_photos_qty` (int) → Quantidade de fotos do produto  
- `product_weight_g` (int) → Peso em gramas  
- `product_length_cm` (int) → Comprimento em cm  
- `product_height_cm` (int) → Altura em cm  
- `product_width_cm` (int) → Largura em cm  

### **Tabela: sellers**
- `seller_id` (string) → Identificador único do vendedor  
- `seller_zip_code_prefix` (string) → CEP do vendedor  
- `seller_city` (string) → Cidade do vendedor  
- `seller_state` (string) → Estado do vendedor  

### **Tabela: geolocation**
- `geolocation_zip_code_prefix` (string) → Prefixo do CEP  
- `geolocation_lat` (double) → Latitude  
- `geolocation_lng` (double) → Longitude  
- `geolocation_city` (string) → Cidade  
- `geolocation_state` (string) → Estado  

---

## 3. Fonte de Dados

Os dados foram carregados a partir de arquivos CSV hospedados em um bucket no Google Cloud Storage (GCS) com upload feito manualmente.

Origem: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
Bucket no GCS: gs://olist-csv-bucket/.
