-- Create table for Main order
CREATE TABLE if not exists raw_data.order_review (
    review_id character varying(256) NOT NULL ENCODE lzo,
    order_id character varying(256) ENCODE lzo,
    review_score integer ENCODE az64,
    review_comment_title character varying(256) ENCODE lzo,
    review_comment_message character varying(256) ENCODE lzo,
    review_creation_date timestamp without time zone ENCODE az64,
    review_answer_timestamp timestamp without time zone ENCODE az64,
    order_purchase_timestamp timestamp without time zone ENCODE az64,
    year integer ENCODE az64,
    PRIMARY KEY (review_id)
) DISTSTYLE AUTO;

-- Create table for order_item
CREATE TABLE if not exists raw_data.order_item (
    order_id character varying(256) NOT NULL ENCODE lzo,
    order_item_id integer ENCODE az64,
    product_id character varying(256) ENCODE lzo,
    seller_id character varying(256) ENCODE lzo,
    shipping_limit_date timestamp without time zone ENCODE az64,
    price real ENCODE raw,
    freight_value real ENCODE raw,
    order_purchase_timestamp timestamp without time zone ENCODE az64,
    year integer ENCODE az64,
    PRIMARY KEY (order_id)
) DISTSTYLE AUTO;

-- Create table for order_payment
CREATE TABLE if not exists raw_data.order_payment (
    order_id character varying(256) NOT NULL ENCODE lzo,
    payment_sequential integer ENCODE az64,
    payment_type character varying(256) ENCODE lzo,
    payment_installments integer ENCODE az64,
    payment_value real ENCODE raw,
    order_purchase_timestamp timestamp without time zone ENCODE az64,
    year integer ENCODE az64,
    PRIMARY KEY (order_id)
) DISTSTYLE AUTO;

-- Create table for order_review
CREATE TABLE if not exists raw_data.order_review (
    review_id character varying(256) NOT NULL ENCODE lzo,
    order_id character varying(256) ENCODE lzo,
    review_score integer ENCODE az64,
    review_comment_title character varying(256) ENCODE lzo,
    review_comment_message character varying(256) ENCODE lzo,
    review_creation_date timestamp without time zone ENCODE az64,
    review_answer_timestamp timestamp without time zone ENCODE az64,
    order_purchase_timestamp timestamp without time zone ENCODE az64,
    year integer ENCODE az64,
    PRIMARY KEY (review_id)
) DISTSTYLE AUTO;

-- Create dim table for customer
CREATE TABLE if not exists raw_data.customer (
    customer_id character varying(256) NOT NULL ENCODE lzo,
    customer_unique_id character varying(256) ENCODE lzo,
    customer_zip_code_prefix integer ENCODE az64,
    customer_city character varying(256) ENCODE lzo,
    customer_state character varying(256) ENCODE lzo,
    PRIMARY KEY (customer_id),
    UNIQUE (customer_unique_id)
) DISTSTYLE AUTO;

-- Create dim table for geolocation
CREATE TABLE if not exists raw_data.geolocation (
    geolocation_zip_code_prefix integer NOT NULL ENCODE az64,
    geolocation_lat character varying(256) ENCODE lzo,
    geolocation_lng character varying(256) ENCODE lzo,
    geolocation_city character varying(256) ENCODE lzo,
    geolocation_state character varying(256) ENCODE lzo,
    PRIMARY KEY (geolocation_zip_code_prefix)
) DISTSTYLE AUTO;

-- Create dim table for product
CREATE TABLE if not exists raw_data.product (
    product_id character varying(256) NOT NULL ENCODE lzo,
    product_category_name character varying(256) ENCODE lzo,
    product_name_lenght real ENCODE raw,
    product_description_lenght real ENCODE raw,
    product_photos_qty real ENCODE raw,
    product_weight_g real ENCODE raw,
    product_length_cm real ENCODE raw,
    product_height_cm real ENCODE raw,
    product_width_cm real ENCODE raw,
    PRIMARY KEY (product_id)
) DISTSTYLE AUTO;

-- Create dim table for seller 
CREATE TABLE if not exists raw_data.seller (
    seller_id character varying(256) NOT NULL ENCODE lzo,
    seller_zip_code_prefix integer ENCODE az64,
    seller_city character varying(256) ENCODE lzo,
    seller_state character varying(256) ENCODE lzo,
    PRIMARY KEY (seller_id)
) DISTSTYLE AUTO;

