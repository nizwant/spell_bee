defmodule SpellBeeWeb.HiLive do
  use SpellBeeWeb, :live_view

  def render(assigns) do
    ~H'''
    HI WORLD
    '''
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
