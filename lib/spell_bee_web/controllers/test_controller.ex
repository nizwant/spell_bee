defmodule SpellBeeWeb.TestController do
  use SpellBeeWeb, :controller

  def start(conn, _params) do
    render(conn, :test)
  end
end
