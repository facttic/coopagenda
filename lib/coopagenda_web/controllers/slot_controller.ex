defmodule CoopagendaWeb.SlotController do
  use CoopagendaWeb, :controller

  alias Coopagenda.Agenda
  alias Coopagenda.Agenda.Slot

  def index(conn, _params) do
    slots = Agenda.list_slots()
    render(conn, "index.html", slots: slots)
  end

  def new(conn, _params) do
    changeset = Agenda.change_slot(%Slot{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"slot" => slot_params}) do
    case Agenda.create_slot(slot_params) do
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
end
