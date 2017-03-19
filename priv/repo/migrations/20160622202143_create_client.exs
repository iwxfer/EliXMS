defmodule Cru.Repo.Migrations.CreateClient do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :logo, :string
      add :name, :string
      add :body, :text

      timestamps
    end

  end
end
