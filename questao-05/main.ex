defmodule Texto do
  def palavras_unicas(texto) do
    texto
    |> String.downcase()
    |> IO.inspect()
    |> String.replace(["!", "?", ",", "."], "")
    |> IO.inspect()
    |> String.split()
    |> IO.inspect()
    |> filtrar(fn palavra -> String.length(palavra) > 3 end, [])
    |> IO.inspect()
    |> Enum.uniq()
    |> IO.inspect()
    |> Enum.sort()
    |> IO.inspect()
  end

  defp filtrar([head | tail], funcao, acc) do
    case funcao.(head) do
      true -> filtrar(tail, funcao, [head | acc])
      false -> filtrar(tail, funcao, acc)
    end
  end

  defp filtrar([], _funcao, acc), do: acc
end
