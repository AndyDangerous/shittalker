defmodule Shittalker.UserController do
  use Shittalker.Web, :controller

  def index(conn, _params) do
    users = Repo.all(Shittalker.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(Shittalker.User, id)
    render conn, "show.html", user: user
  end
end
