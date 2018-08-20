defmodule CompanyMarketplace.SessionView do
    use CompanyMarketplace.Web, :view

    def render("show.json", %{user: user, jwt: jwt}) do

        %{
            data: render_one(user, CompanyMarketplace.UserView, "user.json"),
            meta: %{token: jwt}
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

    def render("error.json", _) do
        %{error: "Invalid email or password"}
    end

    def render("delete.json", _) do
        %{ok: true}
    end

    def render("forbidden.json", %{error: error}) do 
        %{error: error}
    end 
end