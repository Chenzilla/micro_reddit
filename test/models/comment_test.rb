require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: 'foobar', email: 'foobar@example.com')
    @post = Post.create(user_id: @user.id, title: 'Title', content: 'Content', post_date: Time.now)
    @comment = Comment.new(user_id: @user.id, post_id: @post.id, content: 'This is a comment')
  end

  test 'is initially valid' do 
    assert @comment.valid?
  end

  test 'is invalid with blank comment' do
    @comment.content = ''
    assert_not @comment.valid?
  end
end
