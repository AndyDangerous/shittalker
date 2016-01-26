defmodule Shittalker.UserTest do
  use Shittalker.ModelCase, async: true
  alias Shittalker.User

  @valid_attrs %{name: "A User", username: "eva", password: "password"}
  @invalid_attrs %{}

  test "changeset with valid attrs" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attrs" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset does not accept long usernames" do
    attrs = Map.put(@valid_attrs, :usernames, "reallysuperlongusername")
    assert username: {"should be at most %{count} characters", [count: 20] in errors_on(%User{}, attrs)}
  end

  test "registration_changeset password must be at least 6 chars long" do
    attrs = Map.put(@valid_attrs, :password, "no")
    changeset = User.registration_changeset(%User{}, attrs)
    assert {:password, {"should be at least %{count} characters", [count: 6]} in changeset.errors}
  end

  test "registration_changeset with valid attrs hashes password" do
    attrs = Map.put(@valid_attrs, :password, "baller")
    changeset = User.registration_changeset(%User{}, attrs)
    %{password: pass, password_hash: pass_hash} = changeset.changes

    assert changeset.valid?
    assert pass_hash
    assert Comeonin.Bcrypt.checkpw(pass, pass_hash)
  end
end
