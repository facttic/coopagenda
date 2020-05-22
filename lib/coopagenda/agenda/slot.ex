defmodule Coopagenda.Agenda.Slot do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:begin, :duration]
  @optional_fields []

  schema "slots" do
    field :begin, :utc_datetime
    field :duration, :integer

    belongs_to :user, Coopagenda.Accounts.User
    many_to_many(:proposals, Coopagenda.Agenda.Proposal, join_through: "slot_proposal", on_replace: :delete)

    timestamps()
  end

  @doc false
  def changeset(slot, attrs) do
    slot
    |> cast(attrs, @optional_fields ++ @required_fields)
    |> validate_required(@required_fields)
  end

  def changeset_update_proposals(slot, proposals) do
    slot
    |> cast(%{}, @optional_fields ++ @required_fields)
    |> put_assoc(:proposals, proposals)
  end
end
