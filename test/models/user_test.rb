require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'rate' do
    user = User.new(name: 'Alice')
    user.raw_rate = 12.3
    user.save!
    assert_equal 12.3, user.reload.rate.value
  end

  test 'rate validation' do
    user = User.new(name: 'Alice')
    user.raw_rate = 12.3
    assert user.valid?
    user.raw_rate = 100.1
    assert user.invalid?
  end
end
