defmodule PentoWeb.SearchLive do
  use PentoWeb, :live_view
  alias Pento.Search
  alias Pento.Search.Query

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign_query()
     |> assign_changeset()
     |> assign_products()}
  end

  def assign_query(socket) do
    socket
    |> assign(:query, %Query{})
  end

  def assign_changeset(%{assigns: %{query: query}} = socket) do
    socket
    |> assign(:changeset, Search.change_search(query))
  end

  def assign_products(socket) do
    socket
    |> assign(:products, [])
  end

  def handle_event(
        "validate",
        %{"query" => query_params} = _params,
        %{assigns: %{query: query}} = socket
      ) do
    changeset = query |> Search.change_search(query_params) |> Map.put(:action, :validate)

    {:noreply,
     socket
     |> assign(:changeset, changeset)}
  end

  def handle_event(
        "search",
        %{"query" => query_params} = _params,
        %{assigns: %{query: query}} = socket
      ) do
    :timer.sleep(1000)

    result = query |> Search.search(query_params)

    with %Ecto.Changeset{} <- result do
      changeset =
        result
        |> Map.put(:action, :insert)

      {:noreply,
       socket
       |> assign(:changeset, changeset)}
    else
      {:ok, products} ->
        {:noreply,
         socket
         |> assign(:products, products)}
    end
  end
end
