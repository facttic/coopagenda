defmodule Coopagenda.AgendaTest do
  use Coopagenda.DataCase

  alias Coopagenda.Agenda

  describe "slots" do
    alias Coopagenda.Agenda.Slot

    @valid_attrs %{begin: "2010-04-17T14:00:00Z", duration: 42}
    @update_attrs %{begin: "2011-05-18T15:01:01Z", duration: 43}
    @invalid_attrs %{begin: nil, duration: nil}

    def slot_fixture(attrs \\ %{}) do
      {:ok, slot} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Agenda.create_slot()

      slot
    end

    test "list_slots/0 returns all slots" do
      slot = slot_fixture()
      assert Agenda.list_slots() == [slot]
    end

    test "get_slot!/1 returns the slot with given id" do
      slot = slot_fixture()
      assert Agenda.get_slot!(slot.id) == slot
    end

    test "create_slot/1 with valid data creates a slot" do
      assert {:ok, %Slot{} = slot} = Agenda.create_slot(@valid_attrs)
      assert slot.begin == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert slot.duration == 42
    end

    test "create_slot/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Agenda.create_slot(@invalid_attrs)
    end

    test "update_slot/2 with valid data updates the slot" do
      slot = slot_fixture()
      assert {:ok, %Slot{} = slot} = Agenda.update_slot(slot, @update_attrs)
      assert slot.begin == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert slot.duration == 43
    end

    test "update_slot/2 with invalid data returns error changeset" do
      slot = slot_fixture()
      assert {:error, %Ecto.Changeset{}} = Agenda.update_slot(slot, @invalid_attrs)
      assert slot == Agenda.get_slot!(slot.id)
    end

    test "delete_slot/1 deletes the slot" do
      slot = slot_fixture()
      assert {:ok, %Slot{}} = Agenda.delete_slot(slot)
      assert_raise Ecto.NoResultsError, fn -> Agenda.get_slot!(slot.id) end
    end

    test "change_slot/1 returns a slot changeset" do
      slot = slot_fixture()
      assert %Ecto.Changeset{} = Agenda.change_slot(slot)
    end
  end
end
