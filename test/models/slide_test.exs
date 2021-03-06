defmodule Cru.SlideTest do
  use Cru.ModelCase

  alias Cru.Slide

  @valid_attrs %{body: "some content", link_text: "some content", link_url: "some content", sub_title: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Slide.changeset(%Slide{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Slide.changeset(%Slide{}, @invalid_attrs)
    refute changeset.valid?
  end
end
