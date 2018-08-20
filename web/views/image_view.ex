defmodule CompanyMarketplace.ImageView do
  use CompanyMarketplace.Web, :view

  def render("index.json", %{images: images}) do
    %{data: render_many(images, CompanyMarketplace.ImageView, "image.json")}
  end

  def render("show.json", %{image: image}) do
    %{data: render_one(image, CompanyMarketplace.ImageView, "image.json")}
  end

  def render("image.json", %{image: image}) do
    %{id: image.id,
      img_link: image.img_link}
  end
end
