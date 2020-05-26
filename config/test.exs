use Mix.Config

config :minibase, MinibaseWeb.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn

config :minibase, Minibase.Repo,
  database: "mini_test",
  pool: Ecto.Adapters.SQL.Sandbox
