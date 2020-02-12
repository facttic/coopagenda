defmodule CoopagendaWeb.ProposalControllerTest do
  use CoopagendaWeb.ConnCase

  alias Coopagenda.Agenda

  @create_attrs %{accepted: true, details: "some details", hosted_by: "some hosted_by", hosting_coop: "some hosting_coop", title: "some title"}
  @update_attrs %{accepted: false, details: "some updated details", hosted_by: "some updated hosted_by", hosting_coop: "some updated hosting_coop", title: "some updated title"}
  @invalid_attrs %{accepted: nil, details: nil, hosted_by: nil, hosting_coop: nil, title: nil}

  def fixture(:proposal) do
    {:ok, proposal} = Agenda.create_proposal(@create_attrs)
    proposal
  end

  describe "index" do
    test "lists all proposals", %{conn: conn} do
      conn = get(conn, Routes.proposal_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Proposals"
    end
  end

  describe "new proposal" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.proposal_path(conn, :new))
      assert html_response(conn, 200) =~ "New Proposal"
    end
  end

  describe "create proposal" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.proposal_path(conn, :create), proposal: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.proposal_path(conn, :show, id)

      conn = get(conn, Routes.proposal_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Proposal"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.proposal_path(conn, :create), proposal: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Proposal"
    end
  end

  describe "edit proposal" do
    setup [:create_proposal]

    test "renders form for editing chosen proposal", %{conn: conn, proposal: proposal} do
      conn = get(conn, Routes.proposal_path(conn, :edit, proposal))
      assert html_response(conn, 200) =~ "Edit Proposal"
    end
  end

  describe "update proposal" do
    setup [:create_proposal]

    test "redirects when data is valid", %{conn: conn, proposal: proposal} do
      conn = put(conn, Routes.proposal_path(conn, :update, proposal), proposal: @update_attrs)
      assert redirected_to(conn) == Routes.proposal_path(conn, :show, proposal)

      conn = get(conn, Routes.proposal_path(conn, :show, proposal))
      assert html_response(conn, 200) =~ "some updated details"
    end

    test "renders errors when data is invalid", %{conn: conn, proposal: proposal} do
      conn = put(conn, Routes.proposal_path(conn, :update, proposal), proposal: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Proposal"
    end
  end

  describe "delete proposal" do
    setup [:create_proposal]

    test "deletes chosen proposal", %{conn: conn, proposal: proposal} do
      conn = delete(conn, Routes.proposal_path(conn, :delete, proposal))
      assert redirected_to(conn) == Routes.proposal_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.proposal_path(conn, :show, proposal))
      end
    end
  end

  defp create_proposal(_) do
    proposal = fixture(:proposal)
    {:ok, proposal: proposal}
  end
end
