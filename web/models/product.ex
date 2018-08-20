defmodule CompanyMarketplace.Product do
  use CompanyMarketplace.Web, :model

  schema "products" do
    field :name, :string
    field :description, :string
    field :price, :float
    field :package, :boolean, default: false
    field :sessions, :integer
    field :subscription, :boolean, default: false
    field :stock_qty, :integer
    field :attributes, :string
    field :options, :string
    belongs_to :company, CompanyMarketplace.Company
    has_many :images, CompanyMarketplace.Image


    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :price, :package, :sessions, :subscription, :stock_qty, :attributes, :options])
    |> validate_required([:name, :description, :price, :package, :sessions, :subscription, :stock_qty, :attributes, :options])
  end

  def get_company_products(company_id) do
    from product in CompanyMarketplace.Product,
      left_join: company in assoc(product, :company),
      where: product.company_id == ^company_id
  end

  def change_product(data, company), do: data |> put_assoc(:company, company)

end

