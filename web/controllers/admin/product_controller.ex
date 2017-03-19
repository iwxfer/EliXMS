defmodule Cru.Admin.ProductController do
  use Cru.Web, :controller

  alias Cru.Product

  plug :scrub_params, "product" when action in [:create, :update]

  def index(conn, _params) do
    products = Repo.all(Product)
    render(conn, "index.html", products: products)
  end

  def new(conn, _params) do
    changeset = Product.changeset(%Product{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{ "product" => product_params }) do
    changeset = Product.changeset(%Product{}, product_params)

    case Repo.insert(changeset) do
      {:ok, _product} ->
        conn
        |> put_flash(:info, "Product created!")
        |> redirect(to: admin_product_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{ "id" => id }) do
    product = Repo.get!(Product, id)
    render conn, "show.html", product: product
  end

  def edit(conn, %{"id" => id}) do
    product = Repo.get!(Product, id)
    changeset = Product.changeset(product)
    render conn, "edit.html", product: product, changeset: changeset
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Repo.get!(Product, id)
    changeset = Product.changeset(product, product_params)

    case Repo.update(changeset) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product updated!")
        |> redirect(to: admin_product_path(conn, :show, product))
      {:error, changeset} ->
        render(conn, "edit.html", product: product, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Repo.get!(Product, id)

    Repo.delete!(product)

    conn
    |> put_flash(:info, "Product deleted!")
    |> redirect(to: admin_product_path(conn, :index))
  end


end
