defmodule CompanyMarketplace.Repo.Migrations.CreateImage do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :img_link, :string
      add :product_id, references(:products), null: false


      timestamps()
    end

  end
end
