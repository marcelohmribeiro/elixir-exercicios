defmodule Autenticador do
  def validar_requisicao(req) do
    with {:ok, token} <- extract_token(req),
    {:ok, role} <- extract_role(req),
    {:ok, payload} <- extract_payload(req) do
      {:ok, %{token: token, payload: payload}}
    end
  end

  def extract_token(%{headers: %{"authorization" => "Bearer " <> token}}) do
    {:ok, token}
  end

  def extract_token(_), do: {:error, :token_invalido}

  def extract_role(%{body: %{"role" => role}}) do
    case role == "admin" do
      true -> {:ok, role}
      false -> {:error, :acesso_negado}
    end
  end

  def extract_role(_), do: {:error, :acesso_negado}

  def extract_payload(%{body: %{"payload" => payload}}) when map_size(payload) == 0 do
    {:error, :payload_vazio}
  end

  def extract_payload(%{body: %{"payload" => payload}}) do
    case payload != nil do
      true -> {:ok, payload}
      false -> {:error, :payload_vazio}
    end
  end

  def extract_payload(_), do: {:error, :payload_vazio}
end
