# [Choice] Node.js version: 14, 12, 10
ARG VARIANT=14
FROM mcr.microsoft.com/vscode/devcontainers/typescript-node:${VARIANT}

# Install VSCODE Server.
WORKDIR /usr
RUN wget https://github.com/cdr/code-server/releases/download/v3.6.0/code-server-3.6.0-linux-amd64.tar.gz
RUN tar xf code-server-3.6.0-linux-amd64.tar.gz
RUN code-server-3.6.0-linux-amd64/bin/code-server --install-extension ms-python.python dbaeumer.vscode-eslint

RUN mkdir /workspace
RUN mkdir -p /root/.ssh
VOLUME /root/.ssh
WORKDIR /workspace

ENV LC_ALL C.UTF-8
ENV SHELL /bin/bash

COPY entrypoint.vscode.sh /scripts/entrypoint.sh

EXPOSE 8000
CMD /scripts/entrypoint.sh



# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment if you want to install an additional version of node using nvm
# ARG EXTRA_NODE_VERSION=10
# RUN su node -c "source /usr/local/share/nvm/nvm.sh && nvm install ${EXTRA_NODE_VERSION}"

# [Optional] Uncomment if you want to install more global node packages
# RUN sudo -u node npm install -g <your-package-list -here>
