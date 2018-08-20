defmodule CompanyMarketplace.Company do
  use CompanyMarketplace.Web, :model

  schema "companies" do
    field :name, :string
    field :logo, :string
    field :category, :string
    field :address, :string
    field :phone, :string
    field :bank_name, :string
    field :bank_account, :string
    belongs_to :user, CompanyMarketplace.User
    has_many :products, CompanyMarketplace.Product

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :logo, :category, :address, :phone, :bank_name, :bank_account])
    |> validate_required([:name])
  end

  def change_user(data, user), do: data |> put_assoc(:user, user)
end
