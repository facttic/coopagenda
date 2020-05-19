defmodule CoopagendaWeb.SlotControllerTest do
  use CoopagendaWeb.ConnCase

  alias Coopagenda.Agenda
  alias Coopagenda.Agenda.Slot

  @create_attrs %{
    begin: "2010-04-17T14:00:00Z",
    duration: 42
  }
  @update_attrs %{
    begin: "2011-05-18T15:01:01Z",
    duration: 43
  }
  @invalid_attrs %{begin: nil, duration: nil}

  def fixture(:slot) do
    {:ok, slot} = Agenda.create_slot(@create_attrs)
    slot
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all slots", %{conn: conn} do
      conn = get(conn, Routes.slot_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create slot" do
    test "renders slot when data is valid", %{conn: conn} do
      conn = post(conn, Routes.slot_path(conn, :create), slot: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.slot_path(conn, :show, id))

      assert %{
               "id" => id,
               "begin" => "2010-04-17T14:00:00Z",
               "duration" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.slot_path(conn, :create), slot: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update slot" do
    setup [:create_slot]

    test "renders slot when data is valid", %{conn: conn, slot: %Slot{id: id} = slot} do
      conn = put(conn, Routes.slot_path(conn, :update, slot), slot: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.slot_path(conn, :show, id))

      assert %{
               "id" => id,
               "begin" => "2011-05-18T15:01:01Z",
               "duration" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, slot: slot} do
      conn = put(conn, Routes.slot_path(conn, :update, slot), slot: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete slot" do
    setup [:create_slot]

    test "deletes chosen slot", %{conn: conn, slot: slot} do
      conn = delete(conn, Routes.slot_path(conn, :delete, slot))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.slot_path(conn, :show, slot))
      end
    end
  end

  defp create_slot(_) do
    slot = fixture(:slot)
    %{slot: slot}
  end
end
