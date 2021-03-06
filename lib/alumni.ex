defmodule School.Alumni do

  def greet_alumni(), do: :hello

  def create_alumni(attrs \\ %{}) do
    IO.inspect(attrs)
  end

  def get_alumni!(id) do
    IO.inspect(id)
  end

  def list_alumni, do: IO.inspect(%{})

  def update_alumni(id, attrs \\ %{}) do
    id
    |> get_alumni!()
    |> IO.inspect()
  end

  def delete_alumni(id) do
    IO.inspect(%{})
  end

end
