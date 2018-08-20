defmodule CompanyMarketplace.UserView do
  use CompanyMarketplace.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, CompanyMarketplace.UserView, "user.json")}
  end

  def render("show.json", %{user: user, jwt: jwt}) do
       %{   status: true,
            data: render_one(user, CompanyMarketplace.UserView, "user.json"),
            meta: %{token: jwt}
        }
  end

  def render("showEdit.json", %{user: user}) do
       %{   status: true,
            data: render_one(user, CompanyMarketplace.UserView, "user.json"),
        }
  end

  def render("verify.json", %{message: message}) do
  %{
      success: message.success,
      message: message.message
  }
  end
  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      username: user.username,
      email: user.email,
      password: user.password,
      isVerified: user.isVerified,
      token: user.token,
      company: to_json_company(user.company)
      }
  end

  def to_json_company(company) do

    if Ecto.assoc_loaded?(company) do
        %{
        id: company.id,
        name: company.name,
        logo: company.logo,
        category: company.category,
        address: company.address,
        phone: company.phone,
        bank_name: company.bank_name,
        bank_account: company.bank_account
        }
    else %{}
    end
  end

end
