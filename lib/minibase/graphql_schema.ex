defmodule Minibase.GraphQLSchema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)

  alias Minibase.Resolver

  query do
    field :designs, list_of(:design) do
      arg(:name, :string)
      arg(:proto, :boolean)

      resolve(&Resolver.design/2)
    end

    field :minis, list_of(:mini) do
      arg(:number, :integer)

      resolve(&Resolver.mini/2)
    end

    field :sailors, list_of(:sailor) do
      arg(:name, :string)

      resolve(&Resolver.sailor/2)
    end
  end

  @desc "A design of Mini 6.50"
  object :design do
    field(:name, :string)
    field(:proto, :boolean)
  end

  @desc "A Mini 6.50"
  object :mini do
    field(:id, :integer)
    field(:design, :design)
    field(:name, :string)
    field(:number, :integer)
    field(:year, :string)
    field(:results, list_of(:result))
    field(:best_results, list_of(:result))
    field(:last_minitransat_result, :result)
  end

  @desc "A Mini 6.50 race"
  object :race do
    field(:name, :string)
    field(:results, list_of(:result))
  end

  @desc "A result for a Mini 6.50 in a race"
  object :result do
    field(:date, :datetime)
    field(:duration, :string)
    field(:mini, :mini)
    field(:race, :race)
    field(:position, :string)
  end

  @desc "A Mini 6.50 Sailor"
  object :sailor do
    field(:name, :string)
    field(:results, list_of(:result))
  end
end
