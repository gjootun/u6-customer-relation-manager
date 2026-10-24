# Handles the three public customer pages.
# Each action loads data into @customers for the matching view.
class CustomersController < ApplicationController
  # GET / (root route): all customers
  def index
    @customers = Customer.all
  end

  # GET /customers/alphabetized: all customers sorted A-Z by name
  def alphabetized
    @customers = Customer.order(:full_name)
  end

  # GET /customers/missing_email: customers with no email (nil or empty)
  def missing_email
    @customers = Customer.where(email_address: [nil, ""])
  end
end