ActiveAdmin.register PostComment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :post_id, :comment
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :post_id, :comment]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :user_id, :post_id, :comment

  
end
