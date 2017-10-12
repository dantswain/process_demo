defmodule SpawnDemo do
  def start_link(count) do
    pid = spawn_link(fn -> loop(count) end)
    Process.register(pid, __MODULE__)
    {:ok, pid}
  end

  def incr(pid \\ __MODULE__) do
    ref = make_ref()
    send(pid, {:incr, self(), ref})
    receive do
      {^ref, count} -> count
    end
  end

  defp loop(count) do
    receive do
      {:incr, from, ref} ->
        send(from, {ref, count + 1})
        loop(count + 1)
    end
  end
end
