defmodule Minibase.Repo.Migrations.AddLastMinitransatResultView do
  use Ecto.Migration

  def up do
    execute """
    CREATE VIEW last_minitransat_result AS
      SELECT *
      FROM result
      WHERE (id, date)
      IN (
        SELECT result.id, max(date)
        FROM result
        INNER JOIN race ON result.race_id = race.id
        WHERE race.name ILIKE '%transat%'
        GROUP BY result.id
      );
    """
  end

  def down do
    execute "DROP VIEW last_minitransat_result;"
  end
end
