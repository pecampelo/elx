defmodule SchoolTest do
  use ExUnit.Case, async: true

  alias School.Alumni

  test "hello/0 sends a :hello atom" do
    assert Alumni.hello() == :world
  end
end
