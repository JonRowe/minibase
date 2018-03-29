defmodule Minibase.Mini do
  use Ecto.Schema

  alias Minibase.{Design, Result}

  schema "mini" do
    field(:name, :string)
    field(:number, :integer)
    field(:year, :string)

    has_one(:last_minitransat_result, {"last_minitransat_result", Result})
    has_many(:best_results, {"best_results", Result})

    belongs_to(:design, Design)
    has_many(:results, Result)

    timestamps()
  end
end
