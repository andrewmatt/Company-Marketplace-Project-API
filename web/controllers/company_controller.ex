defmodule CompanyMarketplace.CompanyController do
  use CompanyMarketplace.Web, :controller

  alias CompanyMarketplace.Company

  def index(conn, _params) do
    companies = Repo.all(Company)
    render conn, "index.json", companies: companies
  end



  def create(conn, %{"company" => company_params}) do
    changeset = Company.changeset(%Company{}, company_params)

    case Repo.insert(changeset) do
      {:ok, company} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", company_path(conn, :show, company))
        |> render "show.json", company: company
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render CompanyMarketplace.ChangesetView, "error.json", changeset: changeset
    end
  end

  def show(conn, %{"id" => id}) do
    company = Repo.get!(Company, id)
    render conn, "show.json", company: company
  end

  def update(conn, %{"company" => company_params}) do
    company = Repo.get!(Company, company_params["id"]) |> Repo.preload(:user)
    changeset = Company.changeset(company, company_params)

    case Repo.update(changeset) do
      {:ok, company} ->
        render conn, "show.json", company: company
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render CompanyMarketplace.ChangesetView, "error.json", changeset: changeset
    end
  end

end
