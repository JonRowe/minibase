use Mix.Config

config :minibase, MinibaseWeb.Endpoint,
  load_from_system_env: true,
  url: [host: "minibase.herokuapp.com", port: 443],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info
