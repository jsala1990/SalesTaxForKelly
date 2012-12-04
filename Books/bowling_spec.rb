#bowling_spec.rb
#require 'spec_helper'
require_relative 'bowling'

describe Bowling, "#score" do
  it "returns 0 for all gutter game" do
    bowling = Bowling.new
    20.times { bowling.hit(0)}
    bowling.score.should eq(0)
  end
end

describe Bowling, "#score" do
  it "returns 100 for all gutter game" do 
    bowling = Bowling.new
    20.times { bowling.hit(2)}
    bowling.score.should eq(2)
  end
end


