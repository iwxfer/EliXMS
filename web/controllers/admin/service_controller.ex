defmodule Cru.Admin.ServiceController do
  use Cru.Web, :controller

  alias Cru.Service

  plug :scrub_params, "service" when action in [:create, :update]

  def index(conn, _params) do
    services = Repo.all(Service)
    render(conn, "index.html", services: services)
  end

  def new(conn, _params) do
    changeset = Service.changeset(%Service{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{ "service" => service_params }) do
    changeset = Service.changeset(%Service{}, service_params)

    case Repo.insert(changeset) do
      {:ok, _service} ->
        conn
        |> put_flash(:info, "Service created!")
        |> redirect(to: admin_service_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{ "id" => id }) do
    service = Repo.get!(Service, id)
    render conn, "show.html", service: service
  end

  def edit(conn, %{"id" => id}) do
    service = Repo.get!(Service, id)
    changeset = Service.changeset(service)
    render conn, "edit.html", service: service, changeset: changeset
  end

  def update(conn, %{"id" => id, "service" => service_params}) do
    service = Repo.get!(Service, id)
    changeset = Service.changeset(service, service_params)

    case Repo.update(changeset) do
      {:ok, service} ->
        conn
        |> put_flash(:info, "Service updated!")
        |> redirect(to: admin_service_path(conn, :show, service))
      {:error, changeset} ->
        render(conn, "edit.html", service: service, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    service = Repo.get!(Service, id)

    Repo.delete!(service)

    conn
    |> put_flash(:info, "Service deleted!")
    |> redirect(to: admin_service_path(conn, :index))
  end












end
