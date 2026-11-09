defmodule RelatorioVendas do

  def gerar(pedidos) do
      pedidos
      |> Enum.filter(fn %{status: s} -> s == :pago end)
      |> calcular()
  end

  defp calcular([]), do: {:ok, 0, 0.0}

  defp calcular(pagos) do
    soma =
      pagos
      |> Enum.map(fn pedido -> pedido.valor end)
      |> Enum.sum()
    total_pedidos_pagos =
      pagos
      |> Enum.count()
    ticket_medio = soma / total_pedidos_pagos
    {:ok, total_pedidos_pagos, ticket_medio}
  end

end
