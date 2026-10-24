Rails.application.routes.draw do
  # Active Admin lines added by the installer (keep these)
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Home page: the "All Customers" view.
  root "customers#index"

  # Maps /customers/alphabetized to the alphabetized action.
  get "customers/alphabetized", to: "customers#alphabetized"

  # Maps /customers/missing_email to the missing_email action.
  get "customers/missing_email", to: "customers#missing_email"
end