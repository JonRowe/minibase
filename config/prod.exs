use Mix.Config

config :minibase, MinibaseWeb.Endpoint,
  load_from_system_env: true,
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info

# Note this works for heroku, as it compiles on deploy
config :minibase, Minibase.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: "localhost",
  url: System.get_env("DATABASE_URL"),
  pool_size: 10
