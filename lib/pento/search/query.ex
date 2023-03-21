defmodule Pento.Search.Query do
  defstruct [:sku]
  @types %{sku: :string}
  import Ecto.Changeset

  def changeset(%__MODULE__{} = query, attrs) do
    {query, @types}
    |> cast(attrs, Map.keys(@types))
    |> validate_required([:sku])
    |> validate_length(:sku, min: 3)
  end
end
