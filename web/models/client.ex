defmodule Cru.Client do
  use Cru.Web, :model

  schema "clients" do
    field :logo, :string
    field :name, :string
    field :body, :string

    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:logo, :name, :body])
    |> validate_required([:logo, :name, :body])
  end
end
