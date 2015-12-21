defmodule Shittalker.Repo do
  # use Ecto.Repo, otp_app: :shittalker
  @moduledoc """
  In memory repository.
  """

  def all(Shittalker.User) do
    [
      %Shittalker.User{id: "1", name: "Andy", username: "andydangerous", password: "password"},
      %Shittalker.User{id: "2", name: "Alice", username: "alice", password: "password"},
      %Shittalker.User{id: "3", name: "Bob", username: "bob", password: "password"},
    ]
  end
  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
