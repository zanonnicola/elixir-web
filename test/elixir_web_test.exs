defmodule ElixirWebTest do
  use ExUnit.Case
  doctest ElixirWeb

  test "greets the world" do
    assert ElixirWeb.hello() == :world
  end
end
