defmodule Contador do
  def frequencia(lista), do: do_frequencia(lista, %{})

  defp do_frequencia([head | tail], acc) do
    mapa = Map.update(acc, head, 1, fn qtd -> qtd + 1 end)
    do_frequencia(tail, mapa)
  end

  defp do_frequencia([], acc), do: acc
end
