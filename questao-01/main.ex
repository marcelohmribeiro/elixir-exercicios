defmodule Conversor do

  @taxa_usd_brl 5.50
  @taxa_eur_brl 6.00

  def converter(valor, _tupla_moeda) when not is_number(valor) or valor < 0 do
    { :error, "Valor deve ser positivo" }
  end

  def converter(valor, {:usd, :brl}) do
    { :ok, valor * @taxa_usd_brl }
  end

  def converter(valor, {:eur, :brl}) do
    { :ok, valor * @taxa_eur_brl }
  end

  def converter(valor, {:brl, :usd}) do
    { :ok, valor / @taxa_usd_brl }
  end

  def converter(_valor, _par), do: { :error, :conversao_nao_suportada }

end
