defmodule Cru.Admin.SlideController do
  use Cru.Web, :controller

  alias Cru.Slide

  plug :scrub_params, "slide" when action in [:create, :update]

  def index(conn, _params) do
    slides = Repo.all(Slide)
    render(conn, "index.html", slides: slides)
  end

  def new(conn, _params) do
    changeset = Slide.changeset(%Slide{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{ "slide" => slide_params }) do
    changeset = Slide.changeset(%Slide{}, slide_params)

    case Repo.insert(changeset) do
      {:ok, _slide} ->
        conn
        |> put_flash(:info, "Slide created!")
        |> redirect(to: admin_slide_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{ "id" => id }) do
    slide = Repo.get!(Slide, id)
    render conn, "show.html", slide: slide
  end

  def edit(conn, %{"id" => id}) do
    slide = Repo.get!(Slide, id)
    changeset = Slide.changeset(slide)
    render conn, "edit.html", slide: slide, changeset: changeset
  end

  def update(conn, %{"id" => id, "slide" => slide_params}) do
    slide = Repo.get!(Slide, id)
    changeset = Slide.changeset(slide, slide_params)

    case Repo.update(changeset) do
      {:ok, slide} ->
        conn
        |> put_flash(:info, "Slide updated!")
        |> redirect(to: admin_slide_path(conn, :show, slide))
      {:error, changeset} ->
        render(conn, "edit.html", slide: slide, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    slide = Repo.get!(Slide, id)

    Repo.delete!(slide)

    conn
    |> put_flash(:info, "Slide deleted!")
    |> redirect(to: admin_slide_path(conn, :index))
  end










end
