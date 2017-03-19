defmodule Cru.ServiceStyle do
  use Cru.Web, :model

  embedded_schema do
    field :color, :string, default: "#444"
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:color])
    |> validate_required([:color])
  end


end
