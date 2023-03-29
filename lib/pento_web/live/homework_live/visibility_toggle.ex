defmodule PentoWeb.HomeworkLive.VisibilityToggle do
  use PentoWeb, :live_component

  @impl true
  def update(assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign(:expanded, false)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <%= if @expanded do %>
        <button phx-click="hide" phx-target={@myself}>-</button>
      <% else %>
        <button phx-click="expand" phx-target={@myself}>+</button>
      <% end %>
      <%= if @expanded do %>
        <div>
          <%= render_slot(@inner_block) %>
        </div>
      <% end %>
    </div>
    """
  end

  def handle_event("expand", _, socket) do
    {
      :noreply,
      assign(
        socket,
        expanded: true
      )
    }
  end

  def handle_event("hide", _, socket) do
    {
      :noreply,
      assign(
        socket,
        expanded: false
      )
    }
  end
end

# defmodule PentoWeb.HomeworkLive.VisibilityToggle do
#   use PentoWeb, :live_component

#   @impl true
#   def render(_) do
#     ~H"""
#     <div>
#     Test
#     </div>
#     """
#   end
# end
