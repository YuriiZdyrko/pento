defmodule PentoWeb.HomeworkLive.ListItem do
  use Phoenix.Component
  use Phoenix.HTML

  def details(assigns) do
    ~H"""
      <li>
        <%= render_slot(@inner_block) %>
      </li>
    """
  end
end
