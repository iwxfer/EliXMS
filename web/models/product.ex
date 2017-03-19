defmodule Cru.Product do
  use Cru.Web, :model

  schema "products" do
    field :icon, :string
    field :title, :string
    field :body, :string
    embeds_many :features, Cru.ProductFeature

    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:icon, :title, :body])
    |> validate_required([:icon, :title, :body])
    |> cast_embed(:features)
  end
end
