defmodule TeacherControllerTest do
  use ExUnit.Case
  doctest TeacherController

  test "greets the world" do
    assert TeacherController.hello() == :world
  end
end
