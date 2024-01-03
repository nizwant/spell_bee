defmodule SpellBeeWeb.TestController do
  use SpellBeeWeb, :controller

  def start(conn, _params) do
    render(conn, :test)
  end

  def name(conn, %{"name" => name}) do
    render(conn, :template_with_name, name: name)
  end
end
