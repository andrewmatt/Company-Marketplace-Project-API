defmodule CompanyMarketplace.UserController do
  use CompanyMarketplace.Web, :controller

  alias CompanyMarketplace.User
  alias CompanyMarketplace.Company
  alias CompanyMarketplace.Email

  def index(conn, _params) do
    users = Repo.all(User)
    render conn, "index.json", users: users
  end

  def create(conn, user_params) do

    changeset = %User{} |> User.registration_changeset(user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
      
        token = generate_new_account_token(user)

        user |> User.registration_changeset(Map.merge(user_params, %{"token"=>token})) |> Repo.update

        cs = %CompanyMarketplace.Company{}
        |> Company.changeset(%{name: user_params["company_name"]})
        |> Company.change_user(user)

        new_conn = Guardian.Plug.api_sign_in(conn, user, :access)
        # ASSIGNS NEW USER TO OUR CONNECTION
        jwt = Guardian.Plug.current_token(new_conn)
        # GRAB THE JWT CREATED FROM THE CONNECTION AND SEND IT TO THE FRONTEND

        case Repo.insert(cs) do
          {:ok, company} ->
           
        end
        user = user |> Repo.preload(:company)
        IO.inspect(user)

        CompanyMarketplace.Email.welcome_html_email(generate_body(user, token), user.email) |> CompanyMarketplace.Mailer.deliver_later
        render conn, "show.json", user: user, jwt: jwt
        

        {error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render CompanyMarketplace.ChangesetView, "error.json", changeset: changeset

    end
  end

  @account_verification_salt "user salt"

  def generate_new_account_token(%User{id: id}) do
        Phoenix.Token.sign(CompanyMarketplace.Endpoint, @account_verification_salt, id)
  end

  def verify_email(conn, %{"token" => token}) do
    case Phoenix.Token.verify(CompanyMarketplace.Endpoint, @account_verification_salt, token, max_age: 86400) do
   {:ok, id} ->

    cs =  Repo.get!(User, id) 
          |> User.changeset(%{"isVerified": true})

      case Repo.update(cs) do
      {:ok, user} ->
        render conn, "verify.json", message: %{message: "User verified", success: true}
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render CompanyMarketplace.ChangesetView, "error.json", changeset: changeset
    end

    {:error, :expired} ->
     render conn, "verify.json", message: %{message: "Token has expired.", success: false}

    {:error, :invalid} ->
     render conn, "verify.json", message: %{message: "Token is invalid.", success: false}

    end
  end

   defp generate_body(user, token) do
    "<div>
      Hi! #{user.email} <br>
      Click the following link to activate your account! <br>
      http://localhost:3000/email-success/#{token}
    </div>"
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    render conn, "show.json", user: user
  end

  def update(conn, %{"user" => user_params}) do
    user = Repo.get!(User, user_params["id"])
    changeset = User.changeset(user, user_params)

    case Repo.update(changeset) do
      {:ok, user} ->
        render conn, "showEdit.json", user: user
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render CompanyMarketplace.ChangesetView, "error.json", changeset: changeset
    end
  end

end
