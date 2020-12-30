#!/usr/bin/env bash

# Azure Environment
export SUBSCRIPTION=your-subscription-id # customize this
export RESOURCE_GROUP=migrate-java-ee-app-to-azure # you may want to customize by supplying a Resource Group name
export WEBAPP=your-web-app-name # customize this - say, seattle-petstore
export REGION=westus

export DATABASE_SERVER=your-database-server-name # customize this
export DATABASE_ADMIN=selvasingh # customize this
export DATABASE_ADMIN_PASSWORD=SuperS3cr3t # customize this

# ======== Manually Set as part of Step 03 ==========

# FTP Secrets
# Use Azure CLI to get them

export FTP_HOST=
export FTP_USERNAME=
export FTP_PASSWORD=

# ======== DERIVED Environment Variable Values ===========

# Supply these secrets for PostgreSQL
export POSTGRES_SERVER_NAME=postgres-${DATABASE_SERVER}
export POSTGRES_SERVER_ADMIN_LOGIN_NAME=${DATABASE_ADMIN}
export POSTGRES_SERVER_ADMIN_PASSWORD=${DATABASE_ADMIN_PASSWORD}
export POSTGRES_DATABASE_NAME=postgres

# Secrets composed from supplied secrets for PostgreSQL
export POSTGRES_SERVER_FULL_NAME=${POSTGRES_SERVER_NAME}.postgres.database.azure.com
export POSTGRES_CONNECTION_URL=jdbc:postgresql://${POSTGRES_SERVER_FULL_NAME}:5432/${POSTGRES_DATABASE_NAME}?ssl=true
export POSTGRES_SERVER_ADMIN_FULL_NAME=${POSTGRES_SERVER_ADMIN_LOGIN_NAME}@${POSTGRES_SERVER_NAME}

# Supply these secrets for MySQL
export MYSQL_SERVER_NAME=mysql-${DATABASE_SERVER}
export MYSQL_SERVER_ADMIN_LOGIN_NAME=${DATABASE_ADMIN}
export MYSQL_SERVER_ADMIN_PASSWORD=${DATABASE_ADMIN_PASSWORD}
export MYSQL_DATABASE_NAME=petstore

# Secrets composed from supplied secrets for MySQL
export MYSQL_SERVER_FULL_NAME=${MYSQL_SERVER_NAME}.mysql.database.azure.com
export MYSQL_CONNECTION_URL=jdbc:mysql://${MYSQL_SERVER_FULL_NAME}:3306/${MYSQL_DATABASE_NAME}?ssl=true\&useLegacyDatetimeCode=false\&serverTimezone=GMT
export MYSQL_SERVER_ADMIN_FULL_NAME=${MYSQL_SERVER_ADMIN_LOGIN_NAME}\@${MYSQL_SERVER_NAME}

# Supply these secrets for SQLServer
export SQL_SERVER_NAME=sql-${DATABASE_SERVER}
export SQL_SERVER_ADMIN_LOGIN_NAME=${DATABASE_ADMIN}
export SQL_SERVER_ADMIN_PASSWORD=${DATABASE_ADMIN_PASSWORD}
export SQL_DATABASE_NAME=petstore

# Secrets composed from supplied secrets for PostgreSQL
export SQL_SERVER_FULL_NAME=${SQL_SERVER_NAME}.database.windows.net
export SQL_SERVER_ADMIN_FULL_NAME=${SQL_SERVER_ADMIN_LOGIN_NAME}@${SQL_SERVER_NAME}
export SQL_CONNECTION_URL="jdbc:sqlserver://${SQL_SERVER_FULL_NAME}:1433;database=${SQL_DATABASE_NAME};user=${SQL_SERVER_ADMIN_FULL_NAME};password=${SQL_SERVER_ADMIN_PASSWORD};encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;"

# ======== Programmatically Set ==========

#IPCONFIG
export DEVBOX_IP_ADDRESS=$(curl ifconfig.me)