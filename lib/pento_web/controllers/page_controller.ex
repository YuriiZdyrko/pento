# ---
# Excerpted from "Programming Phoenix LiveView",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit https://pragprog.com/titles/liveview for more book information.
# ---
defmodule PentoWeb.PageController do
  use PentoWeb, :controller

  def index(conn, _params) do
    # conn
    # |> redirect(to: Routes.live_path(conn, PentoWeb.WrongLive))
    render(conn, "index.html")
  end
end
