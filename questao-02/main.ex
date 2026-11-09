defmodule Geometria do
  def area(%{tipo: :retangulo, largura: l, altura: a}) when l > 0 and a > 0 do
    { :ok, l * a }
  end

  def area(%{tipo: :retangulo}) do
    { :error, :dimensoes_invalidas }
  end

  def area(%{tipo: :quadrado, lado: a}) when a > 0 do
    { :ok, a * a }
  end

  def area(%{tipo: :quadrado}) do
    { :error, :dimensoes_invalidas }
  end

  def area(%{tipo: :circulo, raio: r}) when r > 0 do
    { :ok, r * r * :math.pi() }
  end

  def area(%{tipo: :circulo}) do
    { :error, :dimensoes_invalidas }
  end

  def area(_) do
    { :error, :forma_desconhecida }
  end

end
