defmodule Shittalker.TestHelpers do
  alias Shittalker.Repo

  def insert_user(attrs \\ %{}) do
    changes = Dict.merge(%{
      name: "User",
      username: "user#{Base.encode16(:crypto.rand_bytes(8))}",
      password: "password",
    }, attrs)

    %Shittalker.User{}
    |> Shittalker.User.registration_changeset(changes)
    |> Repo.insert!()
  end

  def insert_video(user, attrs \\ %{}) do
    user
    |> Ecto.Model.build(:videos, attrs)
    |> Repo.insert!()
  end
end
