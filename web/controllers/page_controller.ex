defmodule Cru.PageController do
  use Cru.Web, :controller


  def index(conn, _params) do
    slides = Repo.all(Cru.Slide)
    services = Repo.all(Cru.Service)
    testimonials = Repo.all(Cru.Testimonial)
    render conn, "index.html", slides: slides, services: services, testimonials: testimonials
  end
end
