require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: 'foobar', email: 'foobar@example.com')
  end

  test 'is valid initially' do 
    assert @user.valid?
  end

  test 'is not valid with blank username' do
    @user.username = ''
    assert_not @user.valid?
  end

  test 'is not valid with blank email' do
    @user.email = ''
    assert_not @user.valid?
  end
end
