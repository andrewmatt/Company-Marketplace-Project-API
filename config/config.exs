# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config
# General application configuration
config :companyMarketplace,
  ecto_repos: [CompanyMarketplace.Repo]

# Configures the endpoint
config :companyMarketplace, CompanyMarketplace.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nOZ5iTSN1AWLe1CnqSK9JsTmEJygGNVxfxN7DVbS68AfIUmgh73VjSLSVygJmUwz",
  render_errors: [view: CompanyMarketplace.ErrorView, accepts: ~w(json)],
  pubsub: [name: CompanyMarketplace.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "CompanyMarketplace",
  ttl: {30, :days},
  verify_issuer: true,
serializer: CompanyMarketplace.GuardianSerializer

config :companyMarketplace, CompanyMarketplace.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.gmail.com",
  # hostname: "gmail",
  port: 587,
  username: "emailtestforapplication2@gmail.com",
  password: "Password2@",
  # username: SYSTEM.get_env("emailTestForApplication@gmail.com"),
  # password: SYSTEM.get_env("Password2@"),

  tls: :always, # can be `:always` or `:never`
  ssl: false, # can be `true`
  retries: 5

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
