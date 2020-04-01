defmodule CoopagendaWeb.SlotLive.Index do
  use Phoenix.LiveView

  alias Coopagenda.Agenda
  alias CoopagendaWeb.SlotView

  def mount(_params, %{"user" => user, "slots" => slots}, socket) do
    if connected?(socket), do: Agenda.subscribe()
    {:ok, assign(socket, slots: slots, user: user, page_title: "Slots list")}
  end

  def render(assigns), do: SlotView.render("index.html", assigns)

  # defp fetch(socket, user) do
  #   slots = Agenda.list_slots()
  #   assign(socket, slots: slots, user: user, page_title: "Slots list")
  # end

  def handle_event("delete_slot", %{"id" => slot_id}, socket) do
    Agenda.get_slot!(slot_id)
    |> Agenda.delete_slot()
    {:noreply, socket}
  end

  def handle_info({Agenda, [:slot, second_parameter], third_parameter}, socket) do
    IO.puts "++++++++++"
    IO.inspect second_parameter
    IO.inspect third_parameter
    IO.inspect socket
    IO.puts "++++++++++"

    {:noreply, socket}
  end
end
