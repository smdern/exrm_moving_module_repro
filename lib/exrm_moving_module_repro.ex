defmodule ExrmMovingModuleRepro do
end

defimpl Poison.Decoder, for: Monetized.Money do
  def decode(%{currency: currency, value: value}, _options) do
    Monetized.Money.make(value, currency: currency)
  end
end
