defmodule Elix.Workers.CourseCreationWorker do

  alias School.Course
  alias School.Alumni

  def send_email_to_course_alumni(%{} = course) do
    # {:ok, alumni} = Course.get(course, :alumni)

    :ok
  end
end
