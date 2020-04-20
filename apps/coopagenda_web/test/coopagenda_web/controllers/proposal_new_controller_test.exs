defmodule CoopagendaWeb.ProposalNewControllerTest do
  use CoopagendaWeb.ConnCase

  alias Coopagenda.AgendaNew
  alias Coopagenda.AgendaNew.ProposalNew

  @create_attrs %{
    accepted: true,
    details: "some details",
    hosted_by: "some hosted_by",
    hosting_coop: "some hosting_coop",
    title: "some title"
  }
  @update_attrs %{
    accepted: false,
    details: "some updated details",
    hosted_by: "some updated hosted_by",
    hosting_coop: "some updated hosting_coop",
    title: "some updated title"
  }
  @invalid_attrs %{accepted: nil, details: nil, hosted_by: nil, hosting_coop: nil, title: nil}

  def fixture(:proposal_new) do
    {:ok, proposal_new} = AgendaNew.create_proposal_new(@create_attrs)
    proposal_new
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all proposals_new", %{conn: conn} do
      conn = get(conn, Routes.proposal_new_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create proposal_new" do
    test "renders proposal_new when data is valid", %{conn: conn} do
      conn = post(conn, Routes.proposal_new_path(conn, :create), proposal_new: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.proposal_new_path(conn, :show, id))

      assert %{
               "id" => id,
               "accepted" => true,
               "details" => "some details",
               "hosted_by" => "some hosted_by",
               "hosting_coop" => "some hosting_coop",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.proposal_new_path(conn, :create), proposal_new: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update proposal_new" do
    setup [:create_proposal_new]

    test "renders proposal_new when data is valid", %{conn: conn, proposal_new: %ProposalNew{id: id} = proposal_new} do
      conn = put(conn, Routes.proposal_new_path(conn, :update, proposal_new), proposal_new: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.proposal_new_path(conn, :show, id))

      assert %{
               "id" => id,
               "accepted" => false,
               "details" => "some updated details",
               "hosted_by" => "some updated hosted_by",
               "hosting_coop" => "some updated hosting_coop",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, proposal_new: proposal_new} do
      conn = put(conn, Routes.proposal_new_path(conn, :update, proposal_new), proposal_new: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete proposal_new" do
    setup [:create_proposal_new]

    test "deletes chosen proposal_new", %{conn: conn, proposal_new: proposal_new} do
      conn = delete(conn, Routes.proposal_new_path(conn, :delete, proposal_new))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.proposal_new_path(conn, :show, proposal_new))
      end
    end
  end

  defp create_proposal_new(_) do
    proposal_new = fixture(:proposal_new)
    {:ok, proposal_new: proposal_new}
  end
end
