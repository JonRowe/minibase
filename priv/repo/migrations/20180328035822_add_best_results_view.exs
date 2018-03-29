defmodule Minibase.Repo.Migrations.AddBestResultsView do
  use Ecto.Migration

  def up do
    execute """
    CREATE VIEW best_results AS
      SELECT * FROM (
        SELECT *, row_number() OVER (PARTITION BY mini_id ORDER BY position) AS rownum
        FROM result
      ) tmp
      WHERE tmp.rownum < 3;
    """
  end

  def down do
    execute "DROP VIEW best_results;"
  end
end
