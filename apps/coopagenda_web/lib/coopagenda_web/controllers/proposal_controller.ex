defmodule CoopagendaWeb.ProposalController do
  use CoopagendaWeb, :controller

  alias Coopagenda.Agenda
  alias Coopagenda.Agenda.Proposal

  action_fallback CoopagendaWeb.FallbackController

  def index(conn, _params) do
    proposals = Agenda.list_proposals()
    render(conn, "index.json", proposals: proposals)
  end

  def create(conn, %{"proposal" => proposal_params}) do
    slot = Agenda.get_slot!(proposal_params.slot_id)
    with {:ok, %Proposal{} = proposal} <- Agenda.create_proposal(slot, proposal_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.slot_proposal_path(conn, :show, proposal))
      |> render("show.json", proposal: proposal)
    end
  end

  def show(conn, %{"id" => id}) do
    proposal = Agenda.get_proposal!(id)
    render(conn, "show.json", proposal: proposal)
  end

  def update(conn, %{"id" => id, "proposal" => proposal_params}) do
    proposal = Agenda.get_proposal!(id)

    with {:ok, %Proposal{} = proposal} <- Agenda.update_proposal(proposal, proposal_params) do
      render(conn, "show.json", proposal: proposal)
    end
  end

  def delete(conn, %{"id" => id}) do
    proposal = Agenda.get_proposal!(id)

    with {:ok, %Proposal{}} <- Agenda.delete_proposal(proposal) do
      send_resp(conn, :no_content, "")
    end
  end
end
