# Docker image
FROM postgres:latest

# Copiando os scripts
COPY ./init /docker-entrypoint-initdb.d/

# Expondo a porta padrão
EXPOSE 5432
