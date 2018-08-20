defmodule CompanyMarketplace.ProductView do
  use CompanyMarketplace.Web, :view

  def render("index.json", %{products: products}) do
    %{status: true,
      data: render_many(products, CompanyMarketplace.ProductView, "product.json")
      }
  end

  def render("show.json", %{product: product}) do
    %{status: true,
      data: render_one(product, CompanyMarketplace.ProductView, "product.json")
      }
  end

 def render("status.json", %{product: product}) do
    %{status: true,
      }
  end

  def render("product.json", %{product: product}) do
    %{id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      package: product.package,
      sessions: product.sessions,
      subscription: product.subscription,
      stock_qty: product.stock_qty,
      attributes: product.attributes,
      options: product.options}
  end
end
