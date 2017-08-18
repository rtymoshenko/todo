require 'rails_helper'

RSpec.describe "tasks/show", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :name => "Name",
      :priority => "Priority",
      :status => false,
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Priority/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
