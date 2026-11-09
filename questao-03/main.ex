defmodule MeuEnum do
  def filtrar(_lista, funcao) when not is_function(funcao, 1), do: {:error, "A função anônima só pode receber 1 argumento"}

  def filtrar(lista, funcao), do: do_filtrar(lista, funcao, [])

  defp do_filtrar([head | tail], funcao, acc) do
    case funcao.(head) do
      true -> do_filtrar(tail, funcao, [head | acc])
      false -> do_filtrar(tail, funcao, acc)
    end
  end

  defp do_filtrar([], _funcao, acc), do: inverter(acc, [])

  defp inverter([head | tail], acc) do
    inverter(tail, [head | acc])
  end

  defp inverter([], acc), do: acc

end
