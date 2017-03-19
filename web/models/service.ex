defmodule Cru.Service do
  use Cru.Web, :model

  schema "services" do
    field :icon, :string
    field :title, :string
    field :body, :string
    embeds_one :style, Cru.ServiceStyle

    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:icon, :title, :body])
    |> validate_required([:icon, :title, :body])
    |> cast_embed(:style)
  end
end
