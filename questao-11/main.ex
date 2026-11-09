defmodule Classificador do
  def avaliar_desempenho({_modo, pontuacao}) when pontuacao < 0, do: {:error, :pontuacao_invalida}

  def avaliar_desempenho({:ranqueada, pontuacao}) when pontuacao >= 1000, do: {:ok, :mestre}
  def avaliar_desempenho({:ranqueada, pontuacao}) when pontuacao in 500..999, do: {:ok, :diamante}
  def avaliar_desempenho({:ranqueada, pontuacao}) when pontuacao in 0..499, do: {:ok, :ouro}

  def avaliar_desempenho({:casual, _pontuacao}), do: {:ok, :sem_ranque}

  def avaliar_desempenho(_), do: {:error, :modo_desconhecido}
end
