defmodule PentoWeb.ProductLive.Show do
  use PentoWeb, :live_view

  alias Pento.Catalog

  # What data does Show.mount/3 add to the socket?
  # - Adds no data, so can be removed
  # @impl true
  # def mount(_params, _session, socket) do
  #   {:ok, socket}
  # end

  # How does the ProductLive.Show live view use the handle_params/3 callback?
  # - handle_params/2 is run automatically after mount/3
  # - assign socket.assigns.page_title, using socket.assigns
  # - assign socket.assigns.product, using id param
  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:my_message, "Hi there!")
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:product, Catalog.get_product!(id))}
  end

  defp page_title(:show), do: "Show Product"
  defp page_title(:edit), do: "Edit Product"
end
