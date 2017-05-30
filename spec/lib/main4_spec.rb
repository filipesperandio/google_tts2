# encoding: UTF-8
require 'spec_helper'

class Test
  include Main4
end

describe Main4 do

  it 'test something' do
    test = Test.new
    test.useless 'somthing'
  end

end

