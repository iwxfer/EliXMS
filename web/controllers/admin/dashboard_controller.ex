defmodule Cru.Admin.DashboardController do
  use Cru.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
