defmodule Pento.Promo do
  alias Pento.Promo.Recipient

  def change_recipient(%Recipient{} = recipient, attrs \\ %{}) do
    Recipient.changeset(recipient, attrs)
  end

  def send_promo(%Recipient{} = recipient, attrs \\ %{}) do
    # send email to promo recipient
    with %{valid?: true} <- Recipient.changeset(recipient, attrs) do
      {:ok, %Recipient{}}
    end
  end
end
