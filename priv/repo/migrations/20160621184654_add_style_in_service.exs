defmodule Cru.Repo.Migrations.AddStyleInService do
  use Ecto.Migration

  def change do
    alter table(:services) do
      add :style, :map
    end
  end
end
