# encoding: UTF-8
require 'spec_helper'

class Test
  include Main3
end

describe Main3 do

  it 'test something' do
    Test.new.useless_big "something"
  end

end

