require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup 
    @user = User.create(username: 'foobar', email: 'foobar@example.com')
    @post = Post.new(user_id: @user.id, title: 'Title', content: 'Content', post_date: Time.now)
  end

  test 'is initially valid' do 
    assert @post.valid?
  end

  test 'is invalid with blank title' do
    @post.title = ''
    assert_not @post.valid?
  end

  test 'is invalid with blank content' do
    @post.content = ''
    assert_not @post.valid?
  end
end
