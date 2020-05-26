use Mix.Config

config :minibase, ecto_repos: [Minibase.Repo]

config :minibase, MinibaseWeb.Endpoint,
  http: [port: System.get_env("PORT")],
  url: [host: "localhost"],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  render_errors: [view: MinibaseWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: Minibase.PubSub

# Note this works for dev and heroku, as it compiles on deploy
config :minibase, Minibase.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: 10

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
