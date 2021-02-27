use Mix.Config

config :minibase, MinibaseWeb.Endpoint,
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{lib/minibase_web/views/.*(ex)$},
      ~r{lib/minibase_web/templates/.*(eex)$}
    ]
  ],
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch",
      cd: Path.expand("../assets", __DIR__)
    ]
  ]

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20
