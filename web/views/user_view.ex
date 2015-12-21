defmodule Shittalker.UserView do
  use Shittalker.Web, :view
  alias Shittalker.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
