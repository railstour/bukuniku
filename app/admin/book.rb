ActiveAdmin.register Book do
  index do
    id_column
    column :title
    column :quantity
    column :price
    column :author
    column :image
    column 'Total Comments' do |book|
      book.reviews.count
    end
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
        column('Actions') { |review| link_to 'delete', review_admin_book_path(book.id, review_id: review.id), data: {method: :delete} }
      end
    end
  end

  member_action 'review', method: :delete do
    review = Review.find(params[:review_id])
    if review.destroy
      flash[:notice] = "Review is destroyed"
    else
      flash[:alert] = review.errors.full_messages.to_sentence
    end
    redirect_to admin_book_path(params[:id])
  end
end
