class AddPaperclipToCat < ActiveRecord::Migration
  def up
    add_attachment :cats, :image
  end

  def down
    remove_attachment :cats, :image
  end
end
