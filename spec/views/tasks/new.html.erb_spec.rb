require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :name => "MyString",
      :priority => "MyString",
      :status => false,
      :project => nil
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_name[name=?]", "task[name]"

      assert_select "input#task_priority[name=?]", "task[priority]"

      assert_select "input#task_status[name=?]", "task[status]"

      assert_select "input#task_project_id[name=?]", "task[project_id]"
    end
  end
end
