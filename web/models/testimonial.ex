defmodule Cru.Testimonial do
  use Cru.Web, :model

  schema "testimonials" do
    field :full_name, :string
    field :designation, :string
    field :company, :string
    field :body, :string

    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:full_name, :designation, :company, :body])
    |> validate_required([:full_name, :designation, :company, :body])
  end
end
