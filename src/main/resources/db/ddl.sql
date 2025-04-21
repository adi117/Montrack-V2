CREATE TABLE "transaction_types" (
  "id" serial PRIMARY KEY,
  "label" varchar(10)
);

CREATE TABLE "metadata" (
  "id" serial PRIMARY KEY,
  "date_created" timestamp,
  "date_updated" timestamp
);

CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "metadata_id" integer references metadata(id),
  "email" varchar(50),
  "password" text,
  "is_new" bool,
  "pin" text,
  "quotes" text,
  "email_validation" bool,
  "language" varchar(20),
  "profile_photo" varchar(255)
);

CREATE TABLE "wallets" (
  "id" serial PRIMARY KEY,
  "account_number" varchar(20),
  "users_id" integer references users(id),
  "metadata_id" integer references metadata(id),
  "name" varchar(100),
  "amount" numeric(10,2),
  "is_used" bool
);

CREATE TABLE "pocket" (
  "id" serial PRIMARY KEY,
  "user_id" integer references users(id),
  "metadata_id" integer references metadata(id),
  "name" varchar(100),
  "amount" numeric(10,2),
  "description" varchar(255)
);

CREATE TABLE "goals" (
  "id" serial PRIMARY KEY,
  "user_id" integer references users(id),
  "metadata_id" integer references metadata(id),
  "name" varchar(100),
  "amount" numeric(10,2),
  "document" varchar(255)
);

CREATE TABLE "transaction" (
  "id" serial PRIMARY KEY,
  "user_id" integer references users(id),
  "pocket_id" integer references pocket(id),
    "goals_id" integer references goals(id),
  "metadata_id" integer references metadata(id),
  "transaction_types_id" integer references transaction_types(id),
  "name" varchar(100),
  "amount" numeric(10,2),
  "document" varchar(255)
);

CREATE TYPE notification_status AS ENUM ('queued', 'sent', 'delivered', 'read');

CREATE TABLE "notifications" (
  "id" serial PRIMARY KEY,
  "user_id" integer references users(id),
  "metadata_id" integer references metadata(id),
  "title" text,
    "description" text,
    "status" notification_status default 'queued'
);

CREATE TABLE user_social_login (
    "id" serial primary key,
    "user_id" integer references users(id),
    "provider" varchar(100) not null,
    "provider_user_id" varchar(255) not null,
    "access_token" text,
    "is_active" bool
);

CREATE TABLE user_devices (
    "id" serial primary key,
    "user_id" integer references users(id),
    "fcm_token" varchar(255) not null unique,
    "device_type" varchar(100)
);
