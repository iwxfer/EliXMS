defmodule Cru.ServiceController do
  use Cru.Web, :controller

  alias Cru.Service

  def show(conn, %{"id" => id}) do
    service = Repo.get!(Service, id)
    render conn, "show.html", service: service
  end
end
