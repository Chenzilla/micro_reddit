require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup 
    @post = Post.new(title: 'Title', content: 'Content', post_date: Time.now)
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
