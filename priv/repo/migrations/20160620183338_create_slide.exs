defmodule Cru.Repo.Migrations.CreateSlide do
  use Ecto.Migration

  def change do
    create table(:slides) do
      add :title, :string
      add :sub_title, :string
      add :body, :string
      add :link_text, :string
      add :link_url, :string

      timestamps
    end

  end
end
