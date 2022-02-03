FROM ubuntu:20.04
LABEL maintainer="Bitbucket Pipelines <pipelines-feedback@atlassian.com>"

# Args
ARG BUILD_DATE
ARG REVISION
ARG BUILD_VERSION
ARG DEBIAN_FRONTEND=noninteractive

# Labels
LABEL \
    org.opencontainers.image.authors="Bitbucket Pipelines <pipelines-feedback@atlassian.com>" \
    org.opencontainers.image.created=$BUILD_DATE \
    org.opencontainers.image.title="atlassian/default-image" \
    org.opencontainers.image.description="Default image for Bitbucket Pipelines" \
    org.opencontainers.image.url="https://bitbucket.org/" \
    org.opencontainers.image.revision=$REVISION \
    org.opencontainers.image.vendor="Atlassian" \
    org.opencontainers.image.version=$BUILD_VERSION

# Install base dependencies
RUN apt-get update \
    && apt-get install -y \
        autoconf \
        build-essential \
        ca-certificates \
        pkg-config \
        software-properties-common \
        wget \
        xvfb \
        curl \
        git \
        ant \
        ssh-client \
        unzip \
        iputils-ping \
        zip \
        jq \
        gettext-base \
        tar \
        parallel \
        unzip \
        apt-transport-https \
        gnupg-agent \
    && rm -rf /var/lib/apt/lists/*

# Install AWS cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && aws --version

# Install Terraform 0.14.11
RUN wget https://releases.hashicorp.com/terraform/1.1.4/terraform_1.1.4_linux_amd64.zip \
    && unzip terraform_1.1.4_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && rm terraform_1.1.4_linux_amd64.zip \
    && terraform -version

# Install Terragrunt
RUN wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.23.4/terragrunt_linux_amd64 \
    && sudo mv terragrunt_linux_amd64 terragrunt \
    && sudo chmod +x terragrunt \
    && sudo mv terragrunt /usr/local/bin/terragrunt \
    && terragrunt --version

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV \
    COMPOSE_VERSION=1.29.2 \
    COMPOSE_SHA256=f3f10cf3dbb8107e9ba2ea5f23c1d2159ff7321d16f0a23051d68d8e2547b323

RUN curl -L "https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
    && echo "${COMPOSE_SHA256}  /usr/local/bin/docker-compose" | sha256sum -c - \
    && chmod +x /usr/local/bin/docker-compose \
    # Test Docker Compose install
    && docker-compose version

# Install nvm with node and npm
ENV NODE_VERSION=14.17.5 \
    NVM_DIR=/root/.nvm \
    NVM_VERSION=0.38.0 \
    NVM_SHA256=b674516f001d331c517be63c1baeaf71de6cbb6d68a44112bf2cff39a6bc246a

RUN curl https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh -o install_nvm.sh \
    && echo "${NVM_SHA256} install_nvm.sh" | sha256sum -c - \
    && bash install_nvm.sh \
    && rm -rf install_nvm.sh \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

# Set node path
ENV NODE_PATH=$NVM_DIR/v$NODE_VERSION/lib/node_modules


# INSTALL tf end tg
# Default to UTF-8 file.encoding
ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    LANGUAGE=C.UTF-8

# Xvfb provide an in-memory X-session for tests that require a GUI
ENV DISPLAY=:99

# Set the path.
ENV PATH=$NVM_DIR:$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# Create dirs and users
RUN mkdir -p /opt/atlassian/bitbucketci/agent/build \
    && sed -i '/[ -z \"PS1\" ] && return/a\\ncase $- in\n*i*) ;;\n*) return;;\nesac' /root/.bashrc \
    && useradd --create-home --shell /bin/bash --uid 1000 pipelines

WORKDIR /opt/atlassian/bitbucketci/agent/build
ENTRYPOINT ["/bin/bash"]