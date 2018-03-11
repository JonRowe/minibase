defmodule Minibase.Mini do
  use Ecto.Schema

  alias Minibase.{Design, Result}

  schema "mini" do
    field(:name, :string)
    field(:number, :integer)
    field(:year, :string)

    belongs_to(:design, Design)
    has_many(:results, Result)

    timestamps()
  end
end
