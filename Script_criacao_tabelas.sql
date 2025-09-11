CREATE DATABASE IF NOT EXISTS olist;
USE olist;

CREATE EXTERNAL TABLE IF NOT EXISTS customers (
  customer_id STRING,
  customer_unique_id STRING,
  customer_zip_code_prefix STRING,
  customer_city STRING,
  customer_state STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION 'gs://olist-csv-bucket/olist/olist_customers_dataset/';

CREATE EXTERNAL TABLE IF NOT EXISTS orders (
  order_id STRING,
  customer_id STRING,
  order_status STRING,
  order_purchase_timestamp TIMESTAMP,
  order_approved_at TIMESTAMP,
  order_delivered_carrier_date TIMESTAMP,
  order_delivered_customer_date TIMESTAMP,
  order_estimated_delivery_date TIMESTAMP
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION 'gs://olist-csv-bucket/olist/olist_orders_dataset/';

CREATE EXTERNAL TABLE IF NOT EXISTS order_items (
  order_id STRING,
  order_item_id INT,
  product_id STRING,
  seller_id STRING,
  shipping_limit_date TIMESTAMP,
  price DOUBLE,
  freight_value DOUBLE
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION 'gs://olist-csv-bucket/olist/olist_order_items_dataset/';

CREATE EXTERNAL TABLE IF NOT EXISTS products (
  product_id STRING,
  product_category_name STRING,
  product_name_length INT,
  product_description_length INT,
  product_photos_qty INT,
  product_weight_g INT,
  product_length_cm INT,
  product_height_cm INT,
  product_width_cm INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION 'gs://olist-csv-bucket/olist/olist_products_dataset/';

CREATE EXTERNAL TABLE IF NOT EXISTS sellers (
  seller_id STRING,
  seller_zip_code_prefix STRING,
  seller_city STRING,
  seller_state STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION 'gs://olist-csv-bucket/olist/olist_sellers_dataset/';

Tabela order_payments
CREATE EXTERNAL TABLE IF NOT EXISTS order_payments (
  order_id STRING,
  payment_sequential INT,
  payment_type STRING,
  payment_installments INT,
  payment_value DOUBLE
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION 'gs://olist-csv-bucket/olist/olist_order_payments_dataset/';

CREATE EXTERNAL TABLE IF NOT EXISTS order_reviews (
  review_id STRING,
  order_id STRING,
  review_score INT,
  review_comment_title STRING,
  review_comment_message STRING,
  review_creation_date STRING,
  review_answer_timestamp STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION 'gs://olist-csv-bucket/olist/olist_order_reviews_dataset/';

CREATE EXTERNAL TABLE IF NOT EXISTS geolocation (
  geolocation_zip_code_prefix STRING,
  geolocation_lat DOUBLE,
  geolocation_lng DOUBLE,
  geolocation_city STRING,
  geolocation_state STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE
LOCATION 'gs://olist-csv-bucket/olist/olist_geolocation_dataset/';
