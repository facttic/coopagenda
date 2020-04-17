defmodule Coopagenda.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :avatar, :string
      add :provider, :string
      add :admin, :boolean, default: false, null: false

      timestamps()
    end

  end
end
