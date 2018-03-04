defmodule Minibase.Repo.Migrations.SetupDB do
  use Ecto.Migration

  def change do
    create table(:design) do
      add :name, :string
      add :proto, :boolean, default: true

      timestamps()
    end

    create unique_index(:design, :name)

    create table(:mini) do
      add :name, :string
      add :number, :integer, null: false
      add :year, :string
      add :design_id, :integer

      timestamps()
    end

    create index(:mini, :design_id)
    create unique_index(:mini, :number)

    create table(:race) do
      add :name, :string

      timestamps()
    end

    create unique_index(:race, :name)

    create table(:result) do
      add :date, :utc_datetime
      add :mini_id, :integer, null: false
      add :position, :string
      add :race_id, :integer, null: false
      add :duration, :string

      timestamps()
    end

    create index(:result, :mini_id)
    create index(:result, :race_id)
    create unique_index(:result, [:date, :mini_id, :race_id])

    create table(:result_sailor) do
      add :result_id, :integer, null: false
      add :sailor_id, :integer, null: false

      timestamps()
    end

    create index(:result_sailor, :result_id)
    create index(:result_sailor, :sailor_id)

    create table(:sailor) do
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:sailor, :name)
  end
end
