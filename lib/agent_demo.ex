defmodule AgentDemo do
  def start_link(count) do
    Agent.start_link(fn -> count end, name: __MODULE__)
  end

  def incr(pid \\ __MODULE__) do
    Agent.get_and_update(pid, fn(count) -> {count + 1, count + 1} end)
  end
end
