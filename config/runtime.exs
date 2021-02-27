import Config

config :minibase, MinibaseWeb.Endpoint,
  http: [port: System.get_env("PORT")],
  url: [host: "localhost"],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  render_errors: [view: MinibaseWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: Minibase.PubSub,
  server: true

# Note this works for dev and heroku, as it compiles on deploy
config :minibase, Minibase.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: 10
