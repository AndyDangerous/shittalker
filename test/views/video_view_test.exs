defmodule Shittalker.VideoViewTest do
  use Shittalker.ConnCase, async: true
  import Phoenix.View

  test "renders index.html" do
    videos = [%Shittalker.Video{id: "1", title: "dogs"},
              %Shittalker.Video{id: "2", title: "cats"}]

    content = render_to_string(Shittalker.VideoView, "index.html", conn: conn, videos: videos)

    assert String.contains?(content, "Listing videos")
    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end

  test "renders new.html" do
    changeset = Shittalker.Video.changeset(%Shittalker.Video{})
    categories = [{"cats", 123}]
    content = render_to_string(Shittalker.VideoView, "new.html", conn: conn, changeset: changeset, categories: categories)

    assert String.contains?(content, "New video")
  end
end
