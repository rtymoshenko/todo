require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :name => "MyString",
      :priority => "MyString",
      :status => false,
      :project => nil
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input#task_name[name=?]", "task[name]"

      assert_select "input#task_priority[name=?]", "task[priority]"

      assert_select "input#task_status[name=?]", "task[status]"

      assert_select "input#task_project_id[name=?]", "task[project_id]"
    end
  end
end
