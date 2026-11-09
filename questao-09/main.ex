defmodule Banco do

  @taxa 2.0

  def autorizar_transferencia(conta_origem, conta_destino, valor) do
    with {:ok, valor} <- validar_valor(valor),
    {:ok} <- verificar_contas(conta_origem, conta_destino),
    {:ok, novo_saldo_origem} <- verificar_saldo(conta_origem, valor) do
      {:ok, %{valor: valor, taxa: @taxa, novo_saldo_origem: novo_saldo_origem}}
    end
  end

  defp validar_valor(valor) do
    case valor > 0 do
      true -> {:ok, valor}
      false -> {:error, :valor_invalido}
    end
  end

  defp verificar_contas(%{status: status_origem}, %{status: status_destino}) do
    case status_origem == :ativa and status_destino == :ativa do
      true -> {:ok}
      false -> {:error, :conta_inativa}
    end
  end

  defp verificar_saldo(%{saldo: saldo_origem}, valor) do
    case saldo_origem >= valor + @taxa do
      true ->
        novo_saldo_origem = saldo_origem - valor - @taxa
        {:ok, novo_saldo_origem}
      false -> {:error, :saldo_insuficiente}
    end
  end
end
