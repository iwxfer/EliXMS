# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Cru.Repo.insert!(%Cru.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Cru.Repo
alias Cru.Slide
alias Cru.Service
alias Cru.Testimonial
alias Cru.Product
alias Cru.Client
alias Cru.Article

body = "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores corporis placeat soluta nulla. Tenetur aperiam distinctio rem accusamus beatae, temporibus? Incidunt earum minus, sapiente vero pariatur dolores velit enim obcaecati."
colors = %{
  0 => "#C4514F",
  1 => "#C5C85B",
  2 => "#67C95E",
  3 => "#62CBBF",
  4 => "#6672CC",
  5 => "#C266CC",
  6 => "#2D866A",
  7 => "#3C2F8E",
  8 => "#D788B1",
  9 => "#A3E0D2"
}

Enum.map(0..9, fn x ->
  slide = Repo.insert!(%Slide{title: "Slide #{x}", sub_title: "Sub title for slide #{x}", body: body, link_text: "VIEW MORE", link_url: "http://google.com/#{x}", style: %Cru.SlideStyle{background_color: colors[x]}})
  IO.puts slide.title
end)

Enum.map(0..9, fn x ->
  service = Repo.insert!(%Service{title: "Service #{x}", icon: "taxi", body: body, style: %Cru.ServiceStyle{color: colors[x]}})
  IO.puts service.title
end)

Enum.map(0..9, fn x ->
  testimonial = Repo.insert!(%Testimonial{full_name: "Syed Murtza #{x}", designation: "CEO", company: "Company #{x}", body: body})
  IO.puts testimonial.full_name
end)

Enum.map(0..9, fn x ->
  product = Repo.insert!(%Product{icon: "bank", title: "Product #{x}", body: body})
  IO.puts product.title
end)

Enum.map(0..9, fn x ->
  client = Repo.insert!(%Client{logo: "path/to/logo#{x}.jpg", name: "Client #{x}", body: body})
  IO.puts client.name
end)

Enum.map(0..9, fn x ->
  article = Repo.insert!(%Article{title: "Article #{x}", body: body <> body})
  IO.puts article.title
end)
