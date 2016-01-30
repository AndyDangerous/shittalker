defmodule Shittalker.WatchController do
  use Shittalker.Web, :controller
  alias Shittalker.Video

  def show(conn, $ %{"id" => id}) do
    video = Repo.get!(Video, id)
    render conn, "show.html", video: video
  end
end
