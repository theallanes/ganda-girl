ActiveAdmin.register Product do
  permit_params :product_name, :description, :price, :image, :brand_id, :type_id

  remove_filter :image_attachment,:image_blob
end
