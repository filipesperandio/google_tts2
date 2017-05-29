require 'spec_helper'

class Stub
  include Main3
end

describe Main3 do

  it 'does something' do
    Stub.new.useless1('something')
    Stub.new.useless2('else')
    Stub.new.useless_big 123
  end

end


