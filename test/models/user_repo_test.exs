defmodule Shittalker.UserRepoTest do
  use Shittalker.ModelCase
  alias Shittalker.User

  test "converts unique_constraint on username to error" do
    insert_user(username: "Andy")
    attrs = %{name: "A User", username: "Andy"}
    changeset = User.changeset(%User{}, attrs)

    assert {:error, changeset} = Repo.insert(changeset)
    assert {:username, "has already been taken"} in changeset.errors
  end
end
