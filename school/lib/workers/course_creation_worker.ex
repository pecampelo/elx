defmodule School.CourseCreationWorker do

  alias School.Course
  alias School.Alumni

  def send_email_to_course_alumni(%Course{} = course) do
      {:ok, alumni} = Course.get(course, :alumni)
    end
end
