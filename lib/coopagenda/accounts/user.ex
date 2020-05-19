defmodule Coopagenda.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :admin, :boolean, default: false
    field :avatar, :string
    field :email, :string
    field :provider, :string
    field :username, :string

    has_many :slots, Coopagenda.Agenda.Slot
    has_many :proposals, Coopagenda.Agenda.Proposal

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :avatar, :email, :provider, :admin])
    |> validate_required([:username, :avatar, :email, :provider])
    |> unique_constraint([:username, :provider])
    |> unique_constraint([:email, :provider])
  end
end
