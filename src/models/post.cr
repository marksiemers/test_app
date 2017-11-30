require "granite_orm/adapter/pg"

class Post < Granite::ORM::Base
  adapter pg
  table_name posts

  belongs_to :user

  # id : Int64 primary key is created for you
  field name : String
  field body : String
  field age : Int32
  field published : Bool
  timestamps
end
