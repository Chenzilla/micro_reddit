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

  test 'is not valid with overlong username' do
    @user.email = 'a' * 51
    assert_not @user.valid?
  end

  test 'is not valid with overlong email' do
    @user.email = 'a' * 250 + '@example.com'
    assert_not @user.valid?
  end

  test 'email validation accepts valid emails' do
    valid_addresses = %w[user@example.com User@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test 'email validation rejects invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should not be valid" 
    end
  end

  test 'email addresses are unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
end
