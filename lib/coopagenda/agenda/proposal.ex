defmodule Coopagenda.Agenda.Proposal do
  use Ecto.Schema
  import Ecto.Changeset

  schema "proposals" do
    field :accepted, :boolean, default: false
    field :details, :string
    field :hosted_by, :string
    field :hosting_coop, :string
    field :title, :string
    field :user_id, :id
    field :slot_id, :id

    timestamps()
  end

  @doc false
  def changeset(proposal, attrs) do
    proposal
    |> cast(attrs, [:title, :details, :hosted_by, :hosting_coop, :accepted])
    |> validate_required([:title, :details, :hosted_by, :hosting_coop, :accepted])
  end
end
