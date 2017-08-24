class TblUser < ActiveRecord::Base
  establish_connection(:user_table)   
  self.table_name = 'tbl_user'
end