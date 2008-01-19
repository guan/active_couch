require File.dirname(__FILE__) + '/../spec_helper.rb'

describe "ActiveCouch::Migration #with_key method" do
  it "should set @key correctly" do
    class ByName < ActiveCouch::Migration
      define :by_name, :for_db => 'people' do
        with_key 'name'
      end
    end
    
    ByName.instance_variable_get("@key").should == 'name'
  end
end
