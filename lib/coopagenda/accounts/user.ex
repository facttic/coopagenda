defmodule Coopagenda.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:username, :avatar, :email, :provider]
  @optional_fields [:admin]

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
    |> cast(attrs, @optional_fields ++ @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint([:username, :provider])
    |> unique_constraint([:email, :provider])
  end
end
