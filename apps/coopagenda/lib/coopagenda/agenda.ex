defmodule Coopagenda.Agenda do
  @moduledoc """
  The Agenda context.
  """

  import Ecto.Query, warn: false
  alias Coopagenda.Repo

  alias Coopagenda.Agenda.Slot
  alias Coopagenda.Accounts.User

  @topic inspect(__MODULE__)

  def subscribe do
    Phoenix.PubSub.subscribe(Coopagenda.PubSub, @topic)
  end

  def subscribe(topic_id) do
    Phoenix.PubSub.subscribe(Coopagenda.PubSub, @topic <> "#{topic_id}")
  end

  @doc """
  Returns the list of slots.

  ## Examples

      iex> list_slots()
      [%Slot{}, ...]

  """
  def list_slots do
    Repo.all(Slot) |> Repo.preload(:proposals)
  end

  def list_slots_by_date(year, month, day) do
    {:ok, start_datetime, 0} =
      DateTime.from_iso8601("#{year |> String.pad_leading(4, "0")}-#{month |> String.pad_leading(2, "0")}-#{day |> String.pad_leading(2, "0")}T00:00:00Z")
    {:ok, end_datetime, 0} =
      DateTime.from_iso8601("#{year |> String.pad_leading(4, "0")}-#{month |> String.pad_leading(2, "0")}-#{day |> String.pad_leading(2, "0")}T23:59:59Z")

    slots = Repo.all from s in Slot,
             where: s.begin >= ^start_datetime and
                    s.begin <= ^end_datetime
    slots
      |> Repo.preload(:proposals)
  end

  @doc """
  Gets a single slot.

  Raises `Ecto.NoResultsError` if the Slot does not exist.

  ## Examples

      iex> get_slot!(123)
      %Slot{}

      iex> get_slot!(456)
      ** (Ecto.NoResultsError)

  """
  def get_slot!(id), do: Repo.get!(Slot, id)

  @doc """
  Creates a slot.

  ## Examples

      iex> create_slot(user, %{field: value})
      {:ok, %Slot{}}

      iex> create_slot(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_slot(%User{} = user, attrs \\ %{}) do
    IO.puts "Why"

    user
    |> Ecto.build_assoc(:slots)
    |> Slot.changeset(attrs)
    |> Repo.insert()
    |> notify_subscribers([:topic, :created])
  end

  @doc """
  Updates a slot.

  ## Examples

      iex> update_slot(slot, %{field: new_value})
      {:ok, %Slot{}}

      iex> update_slot(slot, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_slot(%Slot{} = slot, attrs) do
    slot
    |> Slot.changeset(attrs)
    |> Repo.update()
    |> notify_subscribers([:topic, :updated])
  end

  @doc """
  Deletes a slot.

  ## Examples

      iex> delete_slot(slot)
      {:ok, %Slot{}}

      iex> delete_slot(slot)
      {:error, %Ecto.Changeset{}}

  """
  def delete_slot(%Slot{} = slot) do
    Repo.delete(slot)
    |> notify_subscribers([:topic, :deleted])
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking slot changes.

  ## Examples

      iex> change_slot(slot)
      %Ecto.Changeset{source: %Slot{}}

  """
  def change_slot(%Slot{} = slot) do
    Slot.changeset(slot, %{})
  end

  defp notify_subscribers({:ok, result}, event) do
    Phoenix.PubSub.broadcast(Coopagenda.PubSub, @topic, {__MODULE__, event, result})
    Phoenix.PubSub.broadcast(Coopagenda.PubSub, @topic <> "#{result.id}", {__MODULE__, event, result})
    {:ok, result}
  end

  defp notify_subscribers({:error, reason}, _event), do: {:error, reason}

  alias Coopagenda.Agenda.Proposal

  @doc """
  Returns the list of proposals.

  ## Examples

      iex> list_proposals()
      [%Proposal{}, ...]

  """
  def list_proposals do
    Repo.all(Proposal)
  end

  def get_proposals_by_slot(slot_id) do
    Repo.all(Proposal, slot_id: slot_id)
  end

  @doc """
  Gets a single proposal.

  Raises `Ecto.NoResultsError` if the Proposal does not exist.

  ## Examples

      iex> get_proposal!(123)
      %Proposal{}

      iex> get_proposal!(456)
      ** (Ecto.NoResultsError)

  """
  def get_proposal!(id), do: Repo.get!(Proposal, id)

  @doc """
  Creates a proposal.

  ## Examples

      iex> create_proposal(%{field: value})
      {:ok, %Proposal{}}

      iex> create_proposal(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_proposal(%Slot{} = slot, attrs \\ %{}) do
    slot
    |> Ecto.build_assoc(:proposals)
    |> Proposal.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a proposal.

  ## Examples

      iex> update_proposal(proposal, %{field: new_value})
      {:ok, %Proposal{}}

      iex> update_proposal(proposal, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_proposal(%Proposal{} = proposal, attrs) do
    proposal
    |> Proposal.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a proposal.

  ## Examples

      iex> delete_proposal(proposal)
      {:ok, %Proposal{}}

      iex> delete_proposal(proposal)
      {:error, %Ecto.Changeset{}}

  """
  def delete_proposal(%Proposal{} = proposal) do
    Repo.delete(proposal)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking proposal changes.

  ## Examples

      iex> change_proposal(proposal)
      %Ecto.Changeset{source: %Proposal{}}

  """
  def change_proposal(%Proposal{} = proposal) do
    Proposal.changeset(proposal, %{})
  end
end
