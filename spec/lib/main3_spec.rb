require 'spec_helper'

class Stub
  include Main3
end

describe Main3 do

  it 'does something' do
    Stub.new.useless('something')
  end

end


