use Mix.Config

config :minibase, MinibaseWeb.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn

config :minibase, Minibase.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "mini_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
