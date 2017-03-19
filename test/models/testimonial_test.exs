defmodule Cru.TestimonialTest do
  use Cru.ModelCase

  alias Cru.Testimonial

  @valid_attrs %{body: "some content", company: "some content", designation: "some content", full_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Testimonial.changeset(%Testimonial{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Testimonial.changeset(%Testimonial{}, @invalid_attrs)
    refute changeset.valid?
  end
end
