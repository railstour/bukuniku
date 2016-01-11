ActiveAdmin.register Book do
  index do
    id_column
    column :title
    column :quantity
    column :price
    column :author
    column :image
    actions
  end

  filter :title
  filter :quantity
  filter :author
end
