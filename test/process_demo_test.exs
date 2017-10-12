defmodule ProcessDemoTest do
  use ExUnit.Case
  doctest ProcessDemo

  test "greets the world" do
    assert ProcessDemo.hello() == :world
  end
end
