defmodule Cru.Repo.Migrations.CreateService do
  use Ecto.Migration

  def change do
    create table(:services) do
      add :icon, :string
      add :title, :string
      add :body, :text

      timestamps
    end

  end
end
