class AddDefaultImageToBook < ActiveRecord::Migration[5.1]
  def change

    change_column_default :books, :image, "../template/template.jpg"

  end
end
