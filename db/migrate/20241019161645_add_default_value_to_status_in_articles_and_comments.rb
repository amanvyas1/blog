class AddDefaultValueToStatusInArticlesAndComments < ActiveRecord::Migration[7.2]
  def change
    change_column_default :articles, :status, 'public'
    change_column_default :comments, :status, 'public'
  end
end
