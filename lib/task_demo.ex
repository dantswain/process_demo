defmodule TaskDemo do
  def start_link(count) do
    # NOTE this is an unusual use for Task, it is only included here
    # to demonstrate equivalence
    # normally Task is used for short-lived processes
    {:ok, pid} = Task.start_link(__MODULE__, :loop, [count])
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

  def loop(count) do
    receive do
      {:incr, from, ref} ->
        send(from, {ref, count + 1})
        loop(count + 1)
    end
  end
end
