defmodule CompanyMarketplace.Image do
  use CompanyMarketplace.Web, :model

  schema "images" do
    field :img_link, :string
    belongs_to :product, CompanyMarketplace.Product
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:img_link])
    |> validate_required([:img_link])
  end
end
