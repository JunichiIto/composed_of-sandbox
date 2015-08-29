require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'rate' do
    user = User.new(name: 'Alice')
    user.rate_value = 12.3
    user.save!
    assert_equal 12.3, user.reload.rate.value
  end

  test 'rate validation' do
    user = User.new(name: 'Alice')
    user.rate_value = 12.3
    assert user.valid?
    user.rate_value = 100.1
    assert user.invalid?
  end

  test 'set rate' do
    user = User.new(name: 'Alice')
    user.rate = Rating.new(12.3)
    user.save!
    assert_equal 12.3, user.reload.rate.value
  end

  test 'set rate with validation' do
    user = User.new(name: 'Alice')
    user.rate = Rating.new(100.1)
    assert user.invalid?
  end
end
