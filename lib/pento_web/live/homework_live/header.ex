defmodule PentoWeb.HomeworkLive.Header do
  use Phoenix.Component
  use Phoenix.HTML

  def details(assigns) do
    ~H"""
      <h1>
        <%=render_slot(@inner_block) %>
      </h1>
    """
  end
end
