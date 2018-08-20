defmodule CompanyMarketplace.ProductTest do
  use CompanyMarketplace.ModelCase

  alias CompanyMarketplace.Product

  @valid_attrs %{attributes: "some content", description: "some content", name: "some content", options: "some content", package: true, price: "120.5", sessions: 42, stockQty: 42, subscription: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Product.changeset(%Product{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Product.changeset(%Product{}, @invalid_attrs)
    refute changeset.valid?
  end
end
