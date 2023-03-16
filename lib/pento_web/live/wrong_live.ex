# ---
# Excerpted from "Programming Phoenix LiveView",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/liveview for more book information.
# ---
defmodule PentoWeb.WrongLive do
  use Phoenix.LiveView, layout: {PentoWeb.LayoutView, "live.html"}
  alias Pento.Accounts

  def mount(_params, session, socket) do
    {:ok,
     assign(socket,
       score: 0,
       message: "Make a guess:",
       time: time(),
       number: random(),
       session_id: session["live_socket_id"]
     )}
  end

  def render(assigns) do
    ~H"""
    <h1>Your score: <%= @score %></h1>
    <h2>
      <%= @message %>
    </h2>
    <h2>
      <%= for n <- 1..10 do %>
        <a href="#" phx-click="guess" phx-value-number= {n} ><%= n %></a>
      <% end %>
    </h2>
    <h2>
      It's <%= @time %>
    </h2>
    <button phx-click="refreshtime">Refresh time</button>
    <pre>
      <%= @current_user.username %>
      <%= @session_id %>
    </pre>
    """
  end

  def handle_event("guess", %{"number" => guess} = data, socket) do
    number = socket.assigns.number
    won = number == String.to_integer(guess)

    message =
      if won do
        "Success! (#{guess})"
      else
        "Your guess: #{guess}. Wrong. Guess again. "
      end

    score =
      if won do
        socket.assigns.score + 1
      else
        socket.assigns.score - 1
      end

    {
      :noreply,
      assign(
        socket,
        message: message,
        score: score
      )
    }
  end

  def handle_event("refreshtime", _, socket) do
    {
      :noreply,
      assign(
        socket,
        time: time()
      )
    }
  end

  def time() do
    DateTime.utc_now() |> to_string
  end

  def random() do
    :rand.uniform(10)
  end
end
