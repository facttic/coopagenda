defmodule CoopagendaWeb.SlotView do
  use CoopagendaWeb, :view
  alias CoopagendaWeb.SlotView
  alias CoopagendaWeb.ProposalView

  def render("index.json", %{slots: slots}) do
    %{data: render_many(slots, SlotView, "slot.json")}
  end

  def render("show.json", %{slot: slot}) do
    %{data: render_one(slot, SlotView, "slot.json")}
  end

  def render("slot.json", %{slot: slot}) do
    %{
      id: slot.id,
      user_id: slot.user_id,
      begin: slot.begin,
      duration: slot.duration,
      proposals: render_many(slot.proposals, ProposalView, "proposal_with_no_slots.json")
    }
  end
end
