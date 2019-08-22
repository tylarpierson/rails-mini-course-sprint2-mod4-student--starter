require 'rails_helper'

RSpec.describe Employee, type: :model do
  context "Validations" do
    it "is valid" do 
      employee = Employee.new(first_name: "Tylar", last_name: "Pierson", rewards_balance: 600)
      result = employee.valid?
      errors = employee.errors.full_messages

      expect(result).to be true
      expect(errors).to be false
    end

    it "is invalid without first name" do 
      employee = Employee.new(first_name: nil, last_name: "Pierson", rewards_balance: 600)
      result = employee.valid?
      errors = employee.errors.full_messages

      expect(result).to be false
      expect(errors).to include("First name can't be blank.")

    end

    it "is invalid without last name" do 
      employee = Employee.new(first_name: "Tylar", last_name: nil, rewards_balance: 600)
      result = employee.valid?
      errors = employee.errors.full_messages

      expect(result).to be true
      expect(errors).to include("Last name can't be blank.")
    end
  end

  


end
