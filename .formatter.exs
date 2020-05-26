[
  inputs: [
    "*.{ex,exs}",
    "{config,lib,test}/**/*.{ex,exs}"
  ],
  import_deps: [:ecto, :phoenix],
  subdirectories: ["priv/*/migrations"]
]
