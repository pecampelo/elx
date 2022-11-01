defmodule School.Mailer do

  use GenServer

  alias School.Course
  alias School.Alumni

  @impl true
  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:get, email}, _from, emails) do
    {:reply, Map.fetch(emails, email), emails}
  end

  def handle_cast({:create, email}, emails) do
    if Map.has_key?(emails, email) do
      {:noreply, emails}
    else
      case Alumni.list_alumni() |> filter_students() do
        {:ok, students} ->
          send_email_to(email, students)

          {:noreply, :sent}

        error ->
          error
      end
    end
  end

  defp filter_students([_|_] = students) do
    {:ok, students |> Enum.filter(fn std -> std.status != "cancelled" end)}
  end

  defp filter_students([]), do: {:error, :no_alumni_registered}

  defp send_email_to(email, [_|_] = students) do
    Enum.map(students, fn std ->
      send_email(email, std.id)
    end)
  end

  defp send_email(email, id), do: IO.puts("SENT!")
end
