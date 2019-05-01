defmodule SelectWeb.PageController do
  use SelectWeb, :controller

  def index(conn, _params) do
    live_render(conn, SelectWeb.PageLive.Index, session: %{})
  end
end
