ActiveAdmin.register Post do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :title, :body, :strong, :part
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :title, :body, :strong, :part]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :user_id, :title, :body, :strong, :part

  index do
    selectable_column
    id_column
    column :user
    column :title
    column 'いいね数' do |post|
      post.favorites.count
    end
    column 'ブックマーク数' do |post|
      post.books.count
    end
    column 'コメント数' do |post|
      post.post_comments.count
    end
    column :created_at
    column :updated_at
    actions
  end
end
