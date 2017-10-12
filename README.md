# A Counter 4 Ways

This repository contains four different Elixir implementations of a counter,
demonstrating the various ways that we can use processes in Elixir to store
state.

Use `iex -S mix` to launch a shell and play with the demos.

## SpawnDemo

```elixir
iex(1)> SpawnDemo.start_link(0)
{:ok, #PID<0.113.0>}
iex(2)> SpawnDemo.incr
incr/0    incr/1
iex(2)> SpawnDemo.incr
1
iex(3)> SpawnDemo.incr
2
iex(4)> SpawnDemo.incr
3
```

## TaskDemo

```elixir
iex(1)> TaskDemo.start_link(0)
{:ok, #PID<0.112.0>}
iex(2)> TaskDemo.incr
1
iex(3)> TaskDemo.incr
2
iex(4)> TaskDemo.incr
3
```

## AgentDemo

```elixir
iex(1)> AgentDemo.start_link(0)
{:ok, #PID<0.112.0>}
iex(2)> AgentDemo.incr
1
iex(3)> AgentDemo.incr
2
iex(4)> AgentDemo.incr
3
```

## GenServerDemo

```elixir
iex(1)> GenServerDemo.start_link(0)
{:ok, #PID<0.112.0>}
iex(2)> GenServerDemo.incr
1

# wait a few seconds for the log

iex(3)>
10:09:54.188 [debug] #PID<0.112.0> COUNT AT 1

nil

# do the next two back-to-back quickly

iex(4)> GenServerDemo.incr
2
iex(5)> GenServerDemo.incr
3
iex(6)>
10:09:58.777 [debug] #PID<0.112.0> COUNT AT 3
```
