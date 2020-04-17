defmodule Coopagenda.Repo.Migrations.CreateProposals do
  use Ecto.Migration

  def change do
    create table(:proposals) do
      add :title, :string
      add :details, :string
      add :hosted_by, :string
      add :hosting_coop, :string
      add :accepted, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing)
      add :slot_id, references(:slots, on_delete: :delete_all)

      timestamps()
    end

    create index(:proposals, [:user_id])
    create index(:proposals, [:slot_id])
  end
end
