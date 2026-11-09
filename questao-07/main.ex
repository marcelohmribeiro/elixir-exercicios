defmodule Cadastro do
  def processar_usuario(mapa) do
    with {:ok, nome} <- validar_nome(mapa),
    {:ok, email} <- validar_email(mapa),
    {:ok, idade} <- validar_idade(mapa) do
      {:ok, {nome, email, idade, status: :ativo}}
    end
  end

  defp validar_nome(%{nome: n}) do
    nome = String.trim(n)
    if nome != "" do
      {:ok, nome}
    else
      {:error, :nome_invalido}
    end
  end

  defp validar_email(%{email: email}) do
    if String.contains?(email, "@") and String.contains?(email, ".") do
      {:ok, email}
    else
      {:error, :email_invalido}
    end

  end

  defp validar_idade(%{idade: idade}) when not is_integer(idade) or idade < 0 do
    {:error, :idade_invalida}
  end

  defp validar_idade(%{idade: idade}) do
      if idade >= 18 do
        {:ok, idade}
      else
        {:error, :menor_de_idade}
    end
  end

end
