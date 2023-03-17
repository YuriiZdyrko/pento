Book has some issues:

1. Homework on Page 60
- redirect from "/" to "/guess" in PageController will break existing tests
```elixir
defmodule PentoWeb.PageController do
  use PentoWeb, :controller

  def index(conn, _params) do
   conn
   |> redirect(to: Routes.live_path(conn, PentoWeb.WrongLive))
```
2. Code on Page 83
- inserting products routes under live_session will break existing tests
```elixir
  scope "/", PentoWeb do
    pipe_through [:browser, :require_authenticated_user]
    live_session :default, on_mount: PentoWeb.UserAuthLive do
      live "/guess", WrongLive
      live "/products", ProductLive.Index, :index
```