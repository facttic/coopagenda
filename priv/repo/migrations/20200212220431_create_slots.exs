defmodule Coopagenda.Repo.Migrations.CreateSlots do
  use Ecto.Migration

  def change do
    create table(:slots) do
      add :begin, :utc_datetime
      add :duration, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:slots, [:user_id])
  end
end
