defmodule Cru.Repo.Migrations.AddFeaturesInProducts do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :features, {:array, :map}
    end
  end
end
