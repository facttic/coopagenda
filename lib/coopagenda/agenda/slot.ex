defmodule Coopagenda.Agenda.Slot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "slots" do
    field :begin, :utc_datetime
    field :duration, :integer
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(slot, attrs) do
    slot
    |> cast(attrs, [:begin, :duration])
    |> validate_required([:begin, :duration])
  end
end
