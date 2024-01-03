defmodule SpellBeeWeb.TestHTML do
  use SpellBeeWeb, :html

  def test(assigns) do
    ~H"""
    welcome to the summoners rift
    """
  end

  def template_with_name(%{name: name} = assigns) do
    ~H"""
    Welcome <%= @name %> to the summoners rift
    """
  end
end
