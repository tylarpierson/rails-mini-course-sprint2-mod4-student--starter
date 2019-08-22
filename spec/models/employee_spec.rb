require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe "Validations" do
    context "first and last name" do
      it { expect(Employee.new(first_name:"Tylar", last_name:"Pierson", rewards_balance: 600)).to be true }
      it { expect(errors = employee.errors.full_messages).to be_empty }
    end
    context "first name nil" do
      it { expect(Employee.new(first_name:nil, last_name:"Pierson", rewards_balance: 600)).to be false }
      it { expect(errors = employee.errors.full_messages).to include("First name can't be blank.") }
    end
    context "last name nil" do 
      it { expect(Employee.new(first_name:"Tylar", last_name:nil, rewards_balance: 600)).to be false }
      it { expect(errors = employee.errors.full_messages).to include("Last name can't be blank.")}
    end
  end

  
end
