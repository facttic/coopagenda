defmodule CoopagendaWeb.ProposalView do
  use CoopagendaWeb, :view
  alias CoopagendaWeb.ProposalView

  def render("index.json", %{proposals: proposals}) do
    %{data: render_many(proposals, ProposalView, "proposal.json")}
  end

  def render("show.json", %{proposal: proposal}) do
    %{data: render_one(proposal, ProposalView, "proposal.json")}
  end

  def render("proposal.json", %{proposal: proposal}) do
    %{id: proposal.id,
      accepted: proposal.accepted,
      details: proposal.details,
      hosted_by: proposal.hosted_by,
      hosting_coop: proposal.hosting_coop,
      title: proposal.title}
  end
end
