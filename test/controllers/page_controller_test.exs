defmodule Shittalker.PageControllerTest do
  use Shittalker.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Shit"
  end
end
