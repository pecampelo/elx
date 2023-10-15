defmodule Elix.Teacher do
  @moduledoc false

  def state(value) do
    receive do
      {caller, :get} ->
        send(caller, value)
        state(value)

      {caller, :set, new_value} ->
        state(new_value)
    after
      5000 ->
        Process.exit(self(), {:terminated, "Teacher was fired."})
    end
  end

  def init() do
    parent = self()

    teacher_1 = trigger_teacher_generation(parent)
    teacher_2 = trigger_teacher_generation(parent)

    receive do
      {:generated_teacher, pid, value} ->
        IO.puts("Receiving trigger for teacher creation.")
        spawn fn ->
          state(value)
        end
    end

    [teacher_1, teacher_2]
  end

  @spec trigger_teacher_generation(pid()) :: [pid()]
  def trigger_teacher_generation(pid \\ self(), teacher_name) do
    parent = pid

    spawn fn ->
      Process.flag(:trap_exit, true)
      # Process.flag(:error_handler, true)
      send(parent, {:generated_teacher, self(), teacher_name})

      receive do
        {:EXIT, pid_exited, reason} ->
          IO.puts("Printing process info for teacher being fired...")
          Process.info(pid_exited)
          IO.inspect(reason, label: "REASON")

          :ok
      after
        5000 ->
          IO.puts("\n\nAfter a while, this triggers.\n")
      end
    end
  end

  @spec get(pid()) :: :ok
  def get(pid) do
    send(pid, {self(), :get})

    :ok
  end

  @spec set(pid(), atom()) :: :ok
  def set(pid \\ self(), value) do
    send(pid, {self(), :set, value})

    :ok
  end
end
