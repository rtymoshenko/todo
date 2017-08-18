require 'rails_helper'

RSpec.describe "projects/show", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :name => "Name",
      :color => "Color"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Color/)
  end
end
