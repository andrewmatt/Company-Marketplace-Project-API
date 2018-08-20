# Company Marketplace

------

Application description: Company-Markeplace is an E-Commerce App that uses React&Redux for the frontend and Elixir for the backend. The communication between apps is done via Http requests and responses (Routes can be found in mix.exs). 

Features: The application has the following functional pages: Login, Register (via Verification Email), Dashboard Page, Company Profile, Edit Company, and a Products CRUD page.

In Elixir I used guardian for authentication combined with comeonin for password hashing and bamboo, bamboo_smtp for mailing using gmail sever. I also used CORSPlug to add Cors. I followed a token strategy using Bearer for login and I also generated a token for account-verification through email. The database used is Postgres and the Model Contains 3 main classes: User, Company and Product. We send data from the front-end using react-redux actions and we use it in the Elixir controllers, and then, we send back a response which we use to update our reducer (a Redux store is used to hold data). 

In the Web Application I used React-Router to create the Sidebar navigation Menu and the Navbar Links. I also used Redux Form, Redux-Auth-Wrapper, React-Router-Redux and others. For styles I used Bootstrap 4 with Font-Awesome 4.7.

------

To start your Phoenix app:
  * Unpack Elixir Archive
  * cd Company-Marketplace-Project-API-master
  * Install dependencies with `mix deps.get`
  * Set your postgres credentials in dev.exs
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phoenix.server`
  
  --IF YOU ENCOUNTER AN ERROR (example fix for windows): find your C compiler
  * cd to your Visual Studio 14 / Or a C compiler (if installed)  
  * cd C:\Program Files\Microsoft Visual Studio 14.0\VC
  * vcvarsall amd64 // <-- this may need to be changed accordingly to your system 

After you successfully opened the server, move to Company-Marketplace-Project-WEB and start the client as well:
[Click Here](https://github.com/andrewmatt/Company-Marketplace-Project-WEB)

------

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
