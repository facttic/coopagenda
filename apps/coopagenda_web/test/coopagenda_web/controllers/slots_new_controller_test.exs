defmodule CoopagendaWeb.SlotsNewControllerTest do
  use CoopagendaWeb.ConnCase

  alias Coopagenda.AgendaNew
  alias Coopagenda.AgendaNew.SlotsNew

  @create_attrs %{
    begin: ~D[2010-04-17],
    duration: 42
  }
  @update_attrs %{
    begin: ~D[2011-05-18],
    duration: 43
  }
  @invalid_attrs %{begin: nil, duration: nil}

  def fixture(:slots_new) do
    {:ok, slots_new} = AgendaNew.create_slots_new(@create_attrs)
    slots_new
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all slots_new", %{conn: conn} do
      conn = get(conn, Routes.slots_new_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create slots_new" do
    test "renders slots_new when data is valid", %{conn: conn} do
      conn = post(conn, Routes.slots_new_path(conn, :create), slots_new: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.slots_new_path(conn, :show, id))

      assert %{
               "id" => id,
               "begin" => "2010-04-17",
               "duration" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.slots_new_path(conn, :create), slots_new: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update slots_new" do
    setup [:create_slots_new]

    test "renders slots_new when data is valid", %{conn: conn, slots_new: %SlotsNew{id: id} = slots_new} do
      conn = put(conn, Routes.slots_new_path(conn, :update, slots_new), slots_new: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.slots_new_path(conn, :show, id))

      assert %{
               "id" => id,
               "begin" => "2011-05-18",
               "duration" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, slots_new: slots_new} do
      conn = put(conn, Routes.slots_new_path(conn, :update, slots_new), slots_new: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete slots_new" do
    setup [:create_slots_new]

    test "deletes chosen slots_new", %{conn: conn, slots_new: slots_new} do
      conn = delete(conn, Routes.slots_new_path(conn, :delete, slots_new))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.slots_new_path(conn, :show, slots_new))
      end
    end
  end

  defp create_slots_new(_) do
    slots_new = fixture(:slots_new)
    {:ok, slots_new: slots_new}
  end
end
