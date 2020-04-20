defmodule Coopagenda.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :username, :string, null: false
      add :avatar, :string
      add :provider, :string
      add :admin, :boolean, default: false, null: false

      timestamps()
    end

    create unique_index(:users, [:username, :provider])
    create unique_index(:users, [:email, :provider])
  end
end
