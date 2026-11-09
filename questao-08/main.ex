defmodule Logistica do
  def calcular_frete(peso, _regiao) when not is_number(peso) or peso <= 0 do
    {:error, "Peso deve ser maior que zero"}
  end

  def calcular_frete(peso, {:nordeste, :padrao}), do: 15 + (peso * 2.5)

  def calcular_frete(peso, {:nordeste, :expresso}), do: 30 + (peso * 4)

  def calcular_frete(peso, {:sul, :padrao}), do: 20 + (peso * 3)

  def calcular_frete(peso, {:sul, :expresso}), do: 38 + (peso * 5)

  def calcular_frete(_peso, _par), do: { :error, :rota_indisponivel }
end
