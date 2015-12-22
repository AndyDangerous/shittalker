defmodule Shittalker.UserController do
  alias Shittalker.User
  use Shittalker.Web, :controller

  def index(conn, _params) do
    users = Repo.all(Shittalker.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(Shittalker.User, id)
    render conn, "show.html", user: user
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "#{user.name} created!")
        |> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Something went wrong. Try again.")
        |> render("new.html", changeset: changeset)
    end
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end
end