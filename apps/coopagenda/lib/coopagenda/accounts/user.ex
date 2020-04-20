defmodule Coopagenda.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :avatar, :string
    field :email, :string
    field :provider, :string
    field :admin, :boolean, default: false

    has_many :slots, Coopagenda.Agenda.Slot
    has_many :proposals, Coopagenda.Agenda.Proposal

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :username, :avatar, :provider, :admin])
    |> validate_required([:email, :username, :avatar, :provider])
  end
end
