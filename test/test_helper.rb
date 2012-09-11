$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')

require 'rspec'
require 'active_record'
require 'affected_by_destroy'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

ActiveRecord::Schema.define(:version => 1) do
  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogs", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "blog_id"
    t.text     "content"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end

class User < ActiveRecord::Base
  has_many :blogs, :dependent => :destroy
end

class Blog < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :posts, :dependent => :destroy
end

class Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :parent, class_name: "Post"
  has_many :children, class_name: "Post", foreign_key: "parent_id", dependent: :destroy
end
