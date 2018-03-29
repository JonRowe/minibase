defmodule Minibase.Resolver do
  alias Minibase.{Design, Mini, Repo, Sailor}

  import Ecto.Query

  def design(%{}, _) do
    graphql(from(d in Design, preload: [mini: :results]))
  end

  def mini(%{}, _) do
    graphql(
      from(
        m in Mini,
        preload: [:design, :last_minitransat_result, best_results: :race, results: :race]
      )
    )
  end

  def sailor(%{}, _) do
    graphql(from(s in Sailor, preload: [results: [:mini, :race]]))
  end

  defp graphql(queryable) do
    {:ok, Repo.all(queryable)}
  end
end
