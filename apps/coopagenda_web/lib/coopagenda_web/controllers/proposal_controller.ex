defmodule CoopagendaWeb.ProposalController do
  use CoopagendaWeb, :controller

  alias Coopagenda.Agenda
  alias Coopagenda.Agenda.Proposal

  def index(conn, %{"slot_id" => slot_id}) do
    proposals = Agenda.get_proposals_by_slot(slot_id)
    render(conn, "index.html", proposals: proposals, slot_id: slot_id)
  end

  def new(conn, %{"slot_id" => slot_id}) do
    changeset = Agenda.change_proposal(%Proposal{})
    render(conn, "new.html", changeset: changeset, slot_id: slot_id)
  end

  def create(conn, %{"proposal" => proposal_params, "slot_id" => slot_id}) do
    slot = Agenda.get_slot!(slot_id)

    case Agenda.create_proposal(slot, proposal_params) do
      {:ok, proposal} ->
        conn
        |> put_flash(:info, "Proposal created successfully.")
        |> redirect(to: Routes.slot_proposal_path(conn, :show, slot_id, proposal))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset, slot_id: slot_id)
    end
  end

  def show(conn, %{"id" => id, "slot_id" => slot_id}) do
    proposal = Agenda.get_proposal!(id)
    render(conn, "show.html", proposal: proposal, slot_id: slot_id)
  end

  def edit(conn, %{"id" => id}) do
    proposal = Agenda.get_proposal!(id)
    changeset = Agenda.change_proposal(proposal)
    render(conn, "edit.html", proposal: proposal, changeset: changeset)
  end

  def update(conn, %{"id" => id, "proposal" => proposal_params}) do
    old_proposal = Agenda.get_proposal!(id)

    case Agenda.update_proposal(old_proposal, proposal_params) do
      {:ok, proposal} ->
        conn
        |> put_flash(:info, "Proposal updated successfully.")
        |> redirect(to: Routes.slot_proposal_path(conn, :show, proposal.slot_id, proposal))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", proposal: old_proposal, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id, "slot_id" => slot_id}) do
    IO.puts "+++++++++++++"
    IO.puts "debug slot_id"
    IO.puts slot_id
    IO.puts "+++++++++++++"

    proposal = Agenda.get_proposal!(id)
    {:ok, _proposal} = Agenda.delete_proposal(proposal)

    conn
    |> put_flash(:info, "Proposal deleted successfully.")
    |> redirect(to: Routes.slot_proposal_path(conn, :index, slot_id))
  end
end
