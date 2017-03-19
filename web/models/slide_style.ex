defmodule Cru.SlideStyle do
  use Cru.Web, :model

  # @primary_key {:id, :binary_id, autogenerate: true}
  embedded_schema do
    field :background_color, :string, default: "#ccc"
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:background_color])
    |> validate_required([:background_color])
  end


end
