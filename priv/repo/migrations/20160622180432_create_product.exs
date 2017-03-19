defmodule Cru.Repo.Migrations.CreateProduct do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :icon, :string
      add :title, :string
      add :body, :string

      timestamps
    end

  end
end
