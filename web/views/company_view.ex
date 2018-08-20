defmodule CompanyMarketplace.CompanyView do
  use CompanyMarketplace.Web, :view

  def render("index.json", %{companies: companies}) do
    %{data: render_many(companies, CompanyMarketplace.CompanyView, "company.json")}
  end

  def render("show.json", %{company: company}) do
    %{data: render_one(company, CompanyMarketplace.CompanyView, "company.json")}
  end

  def render("company.json", %{company: company}) do
    %{id: company.id,
      name: company.name,
      logo: company.logo,
      category: company.category,
      address: company.address,
      phone: company.phone,
      bank_name: company.bank_name,
      bank_account: company.bank_account}
  end

  def render_one(company) do
    %{id: company.id,
      name: company.name,
      logo: company.logo,
      category: company.category,
      address: company.address,
      phone: company.phone,
      bank_name: company.bank_name,
      bank_account: company.bank_account}

  end
end
