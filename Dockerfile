FROM elixir:1.15.0

WORKDIR /app

COPY ./ /app

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install hex phx_new 1.6.11

# compile application
RUN sleep 20 && mix deps.get
RUN mix deps.compile
RUN mix compile



