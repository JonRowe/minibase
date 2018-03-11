defmodule Minibase.Design do
  use Ecto.Schema

  alias Minibase.Mini

  schema "design" do
    field(:name, :string)
    field(:proto, :boolean)

    has_many(:mini, Mini)

    timestamps()
  end
end
