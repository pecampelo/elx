defmodule School do
  @moduledoc """
  Documentation for `Elix`.
  """

  use Application

  @doc """
  Hello world.

  ## Examples

      iex> Elix.hello()
      :world

  """
  def start(_type, args) do
    :world |> IO.inspect

    School.Supervisor.start_link(name: School.Supervisor)


  end
end
