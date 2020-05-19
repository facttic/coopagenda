defmodule Coopagenda.Agenda.Proposal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "proposals" do
    field :accepted, :boolean, default: false
    field :details, :string
    field :hosted_by, :string
    field :hosting_coop, :string
    field :title, :string

    belongs_to :user, Coopagenda.Accounts.User
    many_to_many(:slots, Coopagenda.Agenda.Slot, join_through: "slot_proposal", on_replace: :delete)

    timestamps()
  end

  @doc false
  def changeset(proposal, attrs) do
    proposal
    |> cast(attrs, [:accepted, :details, :hosted_by, :hosting_coop, :title])
    |> validate_required([:details, :hosted_by, :hosting_coop, :title])
  end
end
