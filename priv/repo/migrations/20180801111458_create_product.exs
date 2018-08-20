defmodule CompanyMarketplace.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :string
      add :price, :float
      add :package, :boolean, default: false, null: false
      add :sessions, :integer
      add :subscription, :boolean, default: false, null: false
      add :stock_qty, :integer
      add :attributes, :string
      add :options, :string
      add :company_id, references(:companies), null: false

      timestamps()
    end
      create unique_index(:products, [:name])

  end
end
