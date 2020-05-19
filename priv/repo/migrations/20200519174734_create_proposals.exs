defmodule Coopagenda.Repo.Migrations.CreateProposals do
  use Ecto.Migration

  def change do
    create table(:proposals) do
      add :accepted, :boolean, default: false, null: false
      add :details, :text
      add :hosted_by, :string
      add :hosting_coop, :string
      add :title, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:proposals, [:user_id])
  end
end
