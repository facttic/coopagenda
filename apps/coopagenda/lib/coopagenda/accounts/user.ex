defmodule Coopagenda.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :avatar, :string
    field :email, :string
    field :provider, :string
    field :admin, :boolean
    has_many :slots, Coopagenda.Agenda.Slot
    has_many :proposals, Coopagenda.Agenda.Proposal

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :avatar, :provider])
    |> validate_required([:email, :avatar, :provider])
  end
end
