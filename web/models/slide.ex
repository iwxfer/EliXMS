defmodule Cru.Slide do
  use Cru.Web, :model

  schema "slides" do
    field :title, :string
    field :sub_title, :string
    field :body, :string
    field :link_text, :string
    field :link_url, :string
    embeds_one :style, Cru.SlideStyle

    timestamps
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :sub_title, :body, :link_text, :link_url])
    |> validate_required([:title, :sub_title, :body, :link_text, :link_url])
    |> cast_embed(:style)
  end
end
