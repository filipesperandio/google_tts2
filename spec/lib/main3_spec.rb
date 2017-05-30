# encoding: UTF-8
require 'spec_helper'

class Test
  include Main3
end

describe Main3 do

  it 'test something' do
    test = Test.new
    test.useless_big "something"
    test.useless2 'somthing'
  end

end

