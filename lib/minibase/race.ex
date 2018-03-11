defmodule Minibase.Race do
  use Ecto.Schema

  alias Minibase.Result

  schema "race" do
    field(:name, :string)

    has_many(:result, Result)

    timestamps()
  end
end
