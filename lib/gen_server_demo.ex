defmodule GenServerDemo do
  use GenServer

  @log_delay 2_000
  require Logger

  def start_link(count) do
    GenServer.start_link(__MODULE__, [count], name: __MODULE__)
  end

  def incr(pid \\ __MODULE__) do
    GenServer.call(pid, :incr)
  end

  def init([count]) do
    {:ok, count}
  end

  def handle_call(:incr, _from, count) do
    {:reply, count + 1, count + 1, @log_delay}
  end

  def handle_info(:timeout, count) do
    Logger.debug(fn -> "#{inspect self()} COUNT AT #{count}" end)
    {:noreply, count}
  end
end
