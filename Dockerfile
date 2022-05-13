FROM elixir:1.12.3

WORKDIR /app

RUN mix new school --module School

