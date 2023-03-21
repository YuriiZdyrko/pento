defmodule Pento.Search do
  import Ecto.Query, warn: false
  alias Pento.Repo

  alias Pento.Catalog.Product
  alias Pento.Search.Query

  def change_search(%Query{} = search, attrs \\ %{}) do
    Query.changeset(search, attrs)
  end

  def search(%Query{} = search, attrs \\ %{}) do
    with %{valid?: true, changes: %{sku: sku}} <- Query.changeset(search, attrs) do
      {:ok,
       Repo.all(
         from product in Product,
           where: product.sku == type(^sku, :integer)
       )}
    end
  end
end
