defmodule Cru.Repo.Migrations.CreateTestimonial do
  use Ecto.Migration

  def change do
    create table(:testimonials) do
      add :full_name, :string
      add :designation, :string
      add :company, :string
      add :body, :text

      timestamps
    end

  end
end
