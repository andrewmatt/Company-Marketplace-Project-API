defmodule CompanyMarketplace.Router do
  use CompanyMarketplace.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/api", CompanyMarketplace do
    pipe_through :api

    get "/users", UserController, :index
    get "/users/:id", UserController, :show
    patch "/users/", UserController, :update
    get "/verify/:token", UserController, :verify_email

    post "/sessions", SessionController, :create
    delete "/sessions", SessionController, :delete
    post "/sessions/refresh", SessionController, :refresh
    post "/users", UserController, :create

    get "/company/:id", CompanyController, :show
    patch "/company/", CompanyController, :update

    get "/product/:id", ProductController, :show
    get "/products/:cid", ProductController, :index
    patch "/product/", ProductController, :update
    delete "/product/:id", ProductController, :delete
    post "/product/", ProductController, :create 

  end

   

end
