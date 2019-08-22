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

  context "attributes" do
    it "has expected attributes" do
     result = Employee.new(first_name: "Tylar", last_name: "Pierson", rewards_balance: 600).attribute_names

      expect(result).to contain_exactly(
       "id", "first_name", "last_name", "rewards_balance", "created_at", "updated_at"
      )      
    end
  end

  context "scopes" do
    describe ".zero_balance" do
      before do 
        Employee.create!(
          { first_name: "Jane", last_name: "Doe", rewards_balance: 0 },
          { first_name: "John", last_name: "Don", rewards_balance: 0 },
          { first_name: "Adam", last_name: "Michael", rewards_balance: 800 },
        )
      end

      it "returns a list of active records" do 
        result = Employee.zero_balance

        expect(result.count).to eq 2
        expect(result.first.first_name).to eq "Jane"
        expect(result.las.first_name).to eq "John"
        expect(result.any? { |employee| employee.first_name == "Adam" }).to be false
      end
    end
  end

  

end
