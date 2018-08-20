defmodule CompanyMarketplace.ProductController do
  use CompanyMarketplace.Web, :controller

  alias CompanyMarketplace.Product
  alias CompanyMarketplace.Company

  def index(conn, params) do
    products = CompanyMarketplace.Product.get_company_products(params["cid"]) |> Repo.all
    render conn, CompanyMarketplace.ProductView, "index.json", products: products
  end

  def create(conn, %{"product" => product_params}) do
    company =  Repo.get!(CompanyMarketplace.Company, product_params["company_id"])

    changeset = Product.changeset(%Product{}, product_params)
    |> Product.change_product(company)

    case Repo.insert(changeset) do
      {:ok, product} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", product_path(conn, :show, product))
        |> render "show.json", product: product
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render CompanyMarketplace.ChangesetView, "error.json", changeset: changeset
    end
  end

  def show(conn, %{"id" => id}) do
    product = Repo.get!(Product, id)
    render conn, "show.json", product: product
  end

  def update(conn, %{ "product" => product_params}) do
    product = Repo.get!(Product, product_params["id"]) |> Repo.preload(:company)
    changeset = Product.changeset(product, product_params)

    case Repo.update(changeset) do
      {:ok, product} ->
        render conn, "show.json", product: product
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render CompanyMarketplace.ChangesetView, "error.json", changeset: changeset
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Repo.get!(Product, id)

    case Repo.delete(product) do
      {:ok, product} ->
        render conn, "status.json", product: product

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render CompanyMarketplace.ChangesetView, "error.json", changeset: changeset
    end

  end
end
