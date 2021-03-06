require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "ActiveCouch::Migration #with_filter method" do
  it "should set @filter correctly" do
    class ByLatitude < ActiveCouch::Migration
      define :for_db => 'hotels' do
        with_filter 'doc.name == "Hilton"'
      end
    end
    # Assertion
    ByLatitude.instance_variable_get("@filter").should == 'doc.name == "Hilton"'
  end
end