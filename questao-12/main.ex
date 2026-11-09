defmodule MeuEnum do
  def mapear(lista, fun), do: do_mapear(lista, fun, [])

  defp do_mapear([], _fun, acc), do: inverter(acc, [])
  defp do_mapear([head | tail], fun, acc), do: do_mapear(tail, fun, [fun.(head) | acc])

  defp inverter([], acc), do: acc
  defp inverter([head | tail], acc), do: inverter(tail, [head | acc])
end
