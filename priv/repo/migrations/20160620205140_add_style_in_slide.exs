defmodule Cru.Repo.Migrations.AddStyleInSlide do
  use Ecto.Migration

  def change do
    alter table(:slides) do
      add :style, :map
    end
  end
end
