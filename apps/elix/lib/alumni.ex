defmodule Elix.Alumni.List do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [])

    :whatls

  end

  def add(pid, alumni) do
    GenServer.cast(pid, alumni) # asynchronous callback
  end

  def view(pid) do
    GenServer.call(pid, :view)
  end

  @impl true
  def init(list) do
    {:ok, list}
  end

  @impl true
  def handle_call(:view, _from, list) do
    {:reply, list, list}
  end

  @impl true
  def handle_cast(alumni, list) do
    {:noreply, [alumni|list]}
  end
end
