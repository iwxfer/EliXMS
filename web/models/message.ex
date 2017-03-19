defmodule Cru.Message do
  use Cru.Web, :model

  schema "messages" do
    field :name, :string
    field :email, :string
    field :phone, :string
    field :body, :string

    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :phone, :body])
    |> validate_required([:name, :email, :phone, :body])
  end
end
