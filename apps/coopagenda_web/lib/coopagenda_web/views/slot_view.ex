defmodule CoopagendaWeb.SlotView do
  use CoopagendaWeb, :view
  alias CoopagendaWeb.SlotView

  def render("index.json", %{slots: slots}) do
    %{data: render_many(slots, SlotView, "slot.json")}
  end

  def render("show.json", %{slot: slot}) do
    %{data: render_one(slot, SlotView, "slot.json")}
  end

  def render("slot.json", %{slot: slot}) do
    %{id: slot.id,
      begin: slot.begin,
      duration: slot.duration}
  end
end
