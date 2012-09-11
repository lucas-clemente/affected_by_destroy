require 'test_helper'

describe AffectedByDestroy do
  it 'shows has_many objects' do
    u = User.create
    b = Blog.create user: u
    u.affected_by_destroy.should == [u, b]
  end

  it 'recursively shows has_many objects' do
    u = User.create
    b = Blog.create user: u
    p = Post.create blog: b
    u.affected_by_destroy.should == [u, b, p]
  end

  it 'shows belongs_to objects' do
    u = User.create
    b = Blog.create user: u
    b.affected_by_destroy.should == [b, u]
  end

  it 'works with self-joining classes' do
    p = Post.create
    p1 = Post.create parent: p
    p2 = Post.create parent: p
    p.affected_by_destroy.should == [p, p1, p2]
  end
end
