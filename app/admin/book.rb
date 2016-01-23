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


  show do |book|
    attributes_table do
      row :id
      row :title
      row :quantity
      row :price
      row :author
      row :image
    end

    panel 'review' do
      reviews = book.reviews
      table_for reviews do
        column('Review') { |review| review.text }
        column('Star') { |review| review.star }
      end
    end
  end
end
