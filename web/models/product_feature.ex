defmodule Cru.ProductFeature do
  use Cru.Web, :model

  # @primary_key {:id, :binary_id, autogenerate: true}
  embedded_schema do
    field :title, :string, default: "title"
    field :body, :string, default: "body"

  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body])
    |> validate_required([:title, :body])
  end
end
