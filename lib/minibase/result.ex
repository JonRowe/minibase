defmodule Minibase.Result do
  use Ecto.Schema

  alias Minibase.{Mini, Race, Sailor}

  schema "result" do
    field(:date, :utc_datetime)
    field(:position, :string)
    field(:duration, :string)

    belongs_to(:mini, Mini)
    belongs_to(:race, Race)
    many_to_many(:sailor, Sailor, join_through: "result_sailor")

    timestamps()
  end
end
