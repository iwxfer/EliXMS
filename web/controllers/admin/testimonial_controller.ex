defmodule Cru.Admin.TestimonialController do
  use Cru.Web, :controller

  alias Cru.Testimonial

  plug :scrub_params, "testimonial" when action in [:create, :update]

  def index(conn, _params) do
    testimonials = Repo.all(Testimonial)
    render(conn, "index.html", testimonials: testimonials)
  end

  def new(conn, _params) do
    changeset = Testimonial.changeset(%Testimonial{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{ "testimonial" => testimonial_params }) do
    changeset = Testimonial.changeset(%Testimonial{}, testimonial_params)

    case Repo.insert(changeset) do
      {:ok, _testimonial} ->
        conn
        |> put_flash(:info, "Testimonial created!")
        |> redirect(to: admin_testimonial_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{ "id" => id }) do
    testimonial = Repo.get!(Testimonial, id)
    render conn, "show.html", testimonial: testimonial
  end

  def edit(conn, %{"id" => id}) do
    testimonial = Repo.get!(Testimonial, id)
    changeset = Testimonial.changeset(testimonial)
    render conn, "edit.html", testimonial: testimonial, changeset: changeset
  end

  def update(conn, %{"id" => id, "testimonial" => testimonial_params}) do
    testimonial = Repo.get!(Testimonial, id)
    changeset = Testimonial.changeset(testimonial, testimonial_params)

    case Repo.update(changeset) do
      {:ok, testimonial} ->
        conn
        |> put_flash(:info, "Testimonial updated!")
        |> redirect(to: admin_testimonial_path(conn, :show, testimonial))
      {:error, changeset} ->
        render(conn, "edit.html", testimonial: testimonial, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    testimonial = Repo.get!(Testimonial, id)

    Repo.delete!(testimonial)

    conn
    |> put_flash(:info, "Testimonial deleted!")
    |> redirect(to: admin_testimonial_path(conn, :index))
  end

end
