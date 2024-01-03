defmodule SpellBeeWeb.TestHTML do
  use SpellBeeWeb, :html

  def test(assigns) do
    ~H"""
    welcome to the summoners rift
    """
  end
end
