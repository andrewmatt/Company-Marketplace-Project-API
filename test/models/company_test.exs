defmodule CompanyMarketplace.CompanyTest do
  use CompanyMarketplace.ModelCase

  alias CompanyMarketplace.Company

  @valid_attrs %{address: "some content", bankAccount: "some content", bankName: "some content", category: "some content", logo: "some content", name: "some content", phone: "some content", regField1: "some content", regField2: "some content", userId: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Company.changeset(%Company{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Company.changeset(%Company{}, @invalid_attrs)
    refute changeset.valid?
  end
end
