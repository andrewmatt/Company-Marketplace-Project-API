defmodule CompanyMarketplace.Email do
  use Bamboo.Phoenix, view: CompanyMarketplace.EmailView

 def welcome_html_email(body, email) do
    new_email
    |> to(email)
    |> from("emailtestforapplication2@gmail.com")
    |> subject("Hi!")
    |> html_body(body)
  end

end
