# Registers the Customer model with Active Admin, which gives us
# full CRUD pages at /admin/customers automatically.
ActiveAdmin.register Customer do
  # Strong parameters: only these fields may be submitted from the admin form.
  # :image must be listed so the file upload is accepted.
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  # Only show filters for plain columns. Without this, Active Admin tries to
  # add a filter for the image attachment, which causes a Ransack error.
  filter :full_name
  filter :phone_number
  filter :email_address
  filter :created_at

    # Custom index table so we can see each customer's image in the admin list.
  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email_address
    column :notes
    column :image do |customer|
      # Only render an image tag if a file was uploaded.
      image_tag customer.image, width: 60 if customer.image.attached?
    end
    actions
  end

  # Custom form so we can add a file upload field for the image.
  form do |f|
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file   # renders a file upload button
    end
    f.actions   # adds the Create/Cancel buttons
  end
end