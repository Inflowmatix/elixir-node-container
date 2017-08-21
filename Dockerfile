FROM inflowsys/elixir-container:latest

ENV NODE_VERSION=6.11.2 \
    LANG=C.UTF-8 \
    NPM_CONFIG_LOGLEVEL=info

RUN mix local.hex --force && mix local.rebar --force

RUN apt-get update \
 && apt-get install -y \
    curl \
    make \
    build-essential \
    sudo \
 && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_6.x \
    | bash - && sudo apt-get install -y nodejs

CMD ["bin/bash"]
