require "granite_orm/adapter/pg"

class PostComment < Granite::ORM::Base
  adapter pg
  table_name post_comments

  belongs_to :user
  belongs_to :post

  # id : Int64 primary key is created for you
  field name : String
  field body : String
  field age : Int32
  field published : Bool
  timestamps
end
