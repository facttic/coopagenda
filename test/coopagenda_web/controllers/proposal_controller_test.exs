defmodule CoopagendaWeb.ProposalControllerTest do
  use CoopagendaWeb.ConnCase

  alias Coopagenda.Agenda
  alias Coopagenda.Agenda.Proposal

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

  def fixture(:proposal) do
    {:ok, proposal} = Agenda.create_proposal(@create_attrs)
    proposal
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all proposals", %{conn: conn} do
      conn = get(conn, Routes.proposal_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create proposal" do
    test "renders proposal when data is valid", %{conn: conn} do
      conn = post(conn, Routes.proposal_path(conn, :create), proposal: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.proposal_path(conn, :show, id))

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
      conn = post(conn, Routes.proposal_path(conn, :create), proposal: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update proposal" do
    setup [:create_proposal]

    test "renders proposal when data is valid", %{conn: conn, proposal: %Proposal{id: id} = proposal} do
      conn = put(conn, Routes.proposal_path(conn, :update, proposal), proposal: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.proposal_path(conn, :show, id))

      assert %{
               "id" => id,
               "accepted" => false,
               "details" => "some updated details",
               "hosted_by" => "some updated hosted_by",
               "hosting_coop" => "some updated hosting_coop",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, proposal: proposal} do
      conn = put(conn, Routes.proposal_path(conn, :update, proposal), proposal: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete proposal" do
    setup [:create_proposal]

    test "deletes chosen proposal", %{conn: conn, proposal: proposal} do
      conn = delete(conn, Routes.proposal_path(conn, :delete, proposal))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.proposal_path(conn, :show, proposal))
      end
    end
  end

  defp create_proposal(_) do
    proposal = fixture(:proposal)
    %{proposal: proposal}
  end
end
