require "granite_orm/adapter/pg"

class Animal < Granite::ORM::Base
  adapter pg
  table_name animals


  # id : Int64 primary key is created for you
  field name : String
  field body : String
  field published : Bool
  timestamps
end
