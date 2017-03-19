defmodule Cru.Admin.MessageController do
  use Cru.Web, :controller

  alias Cru.Message

  def index(conn, _params) do
    messages = Repo.all(Message)
    render(conn, "index.html", messages: messages)
  end

  def show(conn, %{ "id" => id }) do
    message = Repo.get!(Message, id)
    render conn, "show.html", message: message
  end

  def delete(conn, %{"id" => id}) do
    message = Repo.get!(Message, id)

    Repo.delete!(message)

    conn
    |> put_flash(:info, "Message deleted!")
    |> redirect(to: admin_message_path(conn, :index))
  end

end
