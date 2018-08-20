defmodule CompanyMarketplace.Repo.Migrations.AddIsVerifiedToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :isVerified, :boolean
    end  
  end
end
