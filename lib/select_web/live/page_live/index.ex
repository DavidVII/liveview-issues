defmodule SelectWeb.PageLive.Index do
  use Phoenix.LiveView

  def mount(_assigns, socket) do
    types = [
      {"Custom", nil},
      {"Admin", 0},
      {"Staff", 1},
      {"Guest", 2}
    ]

    changeset = Select.Identity.change_user(%Select.Identity.User{})
    {:ok, assign(socket, changeset: changeset, types: types, current_type: nil)}
  end

  def render(assigns), do: SelectWeb.PageView.render("index.html", assigns)

  def handle_event("submit", %{"user" => params}, socket) do
    IO.inspect(params, label: "SUBMITTED")
    IO.inspect(socket.assigns)

    case Select.Identity.create_user(params) do
      {:ok, user} ->
        {:noreply, socket}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  def handle_event("change", %{"user" => params}, socket) do
    IO.inspect(params, label: "CHANGED")
    IO.inspect(socket.assigns)

    case params["type"] do
      "" ->
        {:noreply, assign(socket, current_type: nil)}

      id ->
        {:noreply, assign(socket, current_type: String.to_integer(id))}
    end
  end
end
