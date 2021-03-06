defmodule Cru.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :name, :string
      add :email, :string
      add :phone, :string
      add :body, :text

      timestamps
    end

  end
end
