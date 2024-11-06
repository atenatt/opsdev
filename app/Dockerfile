# Use a lightweight base image
FROM debian:latest

# Install required dependencies
RUN apt-get update && apt-get install -y \
    postgresql-client \
    openssl \
    whiptail \
    whois \
    && apt-get clean

# Set the working directory
WORKDIR /usr/src/app

# Copy application scripts
COPY ./auth ./auth
COPY ./scripts ./scripts
COPY ./config ./config

# Ensure all scripts are executable
RUN chmod +x ./auth/*.sh ./scripts/*.sh ./config/*.sh

# Set the entrypoint to the main menu script
ENTRYPOINT ["./scripts/main.sh"]