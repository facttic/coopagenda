defmodule Coopagenda.Repo.Migrations.AddSlotProposalTable do
  use Ecto.Migration

  def change do
    create table(:slot_proposal, primary_key: false) do
      add :slot_id, references(:slots, on_delete: :delete_all), primary_key: true
      add :proposal_id, references(:proposals, on_delete: :delete_all), primary_key: true
      # timestamps()
    end

    create index(:slot_proposal, [:slot_id])
    create index(:slot_proposal, [:proposal_id])

    create unique_index(:slot_proposal, [:proposal_id, :slot_id],
             name: :proposal_id_slot_id_unique_index
           )
  end
end
