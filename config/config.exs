use Mix.Config

config :minibase, ecto_repos: [Minibase.Repo]

config :minibase, MinibaseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9jCQfSrCKOcd1TiG4dTfgqicYL4X8+9oAoz/Zz6gPo6N2pvAu/lEY8HpWq1i1pa3",
  render_errors: [view: MinibaseWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Minibase.PubSub, adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

import_config "#{Mix.env()}.exs"
