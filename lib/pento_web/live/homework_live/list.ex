defmodule PentoWeb.HomeworkLive.List do
  use Phoenix.Component
  use Phoenix.HTML

  alias PentoWeb.HomeworkLive.ListItem

  def details(assigns) do
    ~H"""
      <ul>
        <%= for item <- @items do %>
          <ListItem.details>
            <%= item %>
          </ListItem.details>
        <% end %>
      </ul>
    """
  end
end
