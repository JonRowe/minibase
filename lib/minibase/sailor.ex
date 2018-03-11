defmodule Minibase.Sailor do
  use Ecto.Schema

  alias Minibase.Result

  schema "sailor" do
    field(:name, :string, null: false)

    many_to_many(:result, Result, join_through: "result_sailor")

    timestamps()
  end
end
