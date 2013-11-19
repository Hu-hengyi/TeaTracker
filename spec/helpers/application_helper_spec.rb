require 'spec_helper'

describe ApplicationHelper do
  it "should generate a css link if a controller has its own stylesheet" do
    helper.stub(:params).and_return({controller: nil}.with_indifferent_access)
    helper.controller_stylesheet_link_tag.should be(nil)

    helper.stub(:params).and_return({controller: "Foo"}.with_indifferent_access)
    link = "#{Rails.public_path}/stylesheets/Foo.css"
    File.stub(:exists?).with(link).and_return(true)
    helper.controller_stylesheet_link_tag.should match /link.*\/assets\/Foo.css/
  end
end