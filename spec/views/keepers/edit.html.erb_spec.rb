require 'spec_helper'

describe "/keepers/edit" do
  before(:each) do
    render 'keepers/edit'
  end

  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/keepers/edit])
  end
end
