defmodule CompanyMarketplace.Repo.Migrations.CreateCompany do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :logo, :string
      add :category, :string
      add :address, :string
      add :phone, :string
      add :bank_name, :string
      add :bank_account, :string
      add :user_id, references(:users), null: false
      timestamps()
    end
      create unique_index(:companies, [:name])

  end
end
