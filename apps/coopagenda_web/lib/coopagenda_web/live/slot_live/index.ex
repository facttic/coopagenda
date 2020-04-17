defmodule CoopagendaWeb.SlotLive.Index do
  use Phoenix.LiveView

  alias Coopagenda.Agenda
  alias CoopagendaWeb.SlotView

  def mount(_params, %{"user" => user, "slots" => slots}, socket) do
    if connected?(socket), do: Agenda.subscribe()
    {:ok,
      socket
      |> assign(slots: slots)
      |> assign(user: user)
      |> assign(page_title: "Slots list")
      |> assign(default_date_time: DateTime.utc_now)
    }
  end

  def render(assigns), do: SlotView.render("index.html", assigns)

  def handle_event("delete_slot", %{"id" => slot_id}, socket) do
    IO.puts "handle_event delete_slot"
    Agenda.get_slot!(slot_id)
    |> Agenda.delete_slot()
    {:noreply, fetch_slots(socket)}
  end

  def handle_event("date_change", %{"filter" => %{"date" => %{"day" => day, "month" => month, "year" => year}}}, socket) do
    IO.puts "handle_event date_change"
    slots = Agenda.list_slots_by_date(year, month, day)
    {:ok, default_date_time, _} =
      DateTime.from_iso8601("#{year}-#{month |> String.pad_leading(2, "0")}-#{day |> String.pad_leading(2, "0")}T00:00:00Z")

    {:noreply,
      socket
      |> assign(slots: slots)
      |> assign(default_date_time: default_date_time)
    }
  end

  def handle_info({Agenda, [:topic, _], _}, socket) do
    IO.puts "handle_info"
    {:noreply, fetch_slots(socket)}
  end

  defp fetch_slots(socket) do
    IO.puts "fetch_slots"
    %DateTime{:year => year, :month => month, :day => day} = DateTime.utc_now

    socket
      |> assign(slots:
        Agenda.list_slots_by_date(year |> Integer.to_string(),
          month |> Integer.to_string(),
          day |> Integer.to_string()))
  end
end
