defmodule CoopagendaWeb.ProposalController do
  use CoopagendaWeb, :controller

  alias Coopagenda.Agenda
  alias Coopagenda.Agenda.Proposal

  def index(conn, _params) do
    proposals = Agenda.list_proposals()
    render(conn, "index.html", proposals: proposals)
  end

  def new(conn, %{"slot_id" => slot_id}) do
    changeset = Agenda.change_proposal(%Proposal{})
    IO.puts "++ new ++"
    IO.puts slot_id
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
    proposal = Agenda.get_proposal!(id)

    case Agenda.update_proposal(proposal, proposal_params) do
      {:ok, proposal} ->
        conn
        |> put_flash(:info, "Proposal updated successfully.")
        |> redirect(to: Routes.proposal_path(conn, :show, proposal))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", proposal: proposal, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    proposal = Agenda.get_proposal!(id)
    {:ok, _proposal} = Agenda.delete_proposal(proposal)

    conn
    |> put_flash(:info, "Proposal deleted successfully.")
    |> redirect(to: Routes.proposal_path(conn, :index))
  end
end
