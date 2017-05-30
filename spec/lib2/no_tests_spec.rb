# encoding: UTF-8
require 'spec_helper'
require_relative '../../lib2/no_tests.rb'

class Test
  include NoTests
end

describe NoTests do

  it 'test something' do
    test = Test.new
    test.useless_big "something"
    test.useless2 'somthing'
  end

end


