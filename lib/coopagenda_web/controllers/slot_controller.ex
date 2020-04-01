defmodule CoopagendaWeb.SlotController do
  use CoopagendaWeb, :controller

  alias Coopagenda.Agenda
  alias Coopagenda.Agenda.Slot
  alias CoopagendaWeb.SlotLive

  plug CoopagendaWeb.Plugs.RequireAdmin when action in [:new, :create, :edit, :update, :delete]
  plug :check_slot_owner when action in [:update, :edit, :delete]

  def index(conn, _params) do
    slots = Agenda.list_slots()

    live_render(conn, SlotLive.Index, session: %{
      "user" => conn.assigns.user,
      "slots" => slots
    })
  end

  def new(conn, _params) do
    changeset = Agenda.change_slot(%Slot{})
    live_render(conn, SlotLive.New, session: %{
      "changeset" => changeset,
      "user" => conn.assigns.user
    })
  end

  def create(conn, %{"slot" => slot_params}) do
    case Agenda.create_slot(conn.assigns.user, slot_params) do
      {:ok, slot} ->
        conn
        |> put_flash(:info, "Slot created successfully.")
        |> redirect(to: Routes.slot_path(conn, :show, slot))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    slot = Agenda.get_slot!(id)
    render(conn, "show.html", slot: slot)
  end

  def edit(conn, %{"id" => id}) do
    slot = Agenda.get_slot!(id)
    changeset = Agenda.change_slot(slot)
    render(conn, "edit.html", slot: slot, changeset: changeset)
  end

  def update(conn, %{"id" => id, "slot" => slot_params}) do
    slot = Agenda.get_slot!(id)

    case Agenda.update_slot(slot, slot_params) do
      {:ok, slot} ->
        conn
        |> put_flash(:info, "Slot updated successfully.")
        |> redirect(to: Routes.slot_path(conn, :show, slot))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", slot: slot, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    slot = Agenda.get_slot!(id)
    {:ok, _slot} = Agenda.delete_slot(slot)

    conn
    |> put_flash(:info, "Slot deleted successfully.")
    |> redirect(to: Routes.slot_path(conn, :index))
  end

  def check_slot_owner(conn, _params) do
    %{params: %{"id" => slot_id}} = conn

    if Agenda.get_slot!(slot_id).user_id == conn.assigns.user.id do
      conn
    else
      conn
      |> put_flash(:error, "You cannot edit that")
      |> redirect(to: Routes.slot_path(conn, :index))
      |> halt()
    end
  end
end
