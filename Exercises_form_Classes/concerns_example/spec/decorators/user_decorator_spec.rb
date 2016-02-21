require 'rails_helper'

RSpec.describe UserDecorator, type: :decorator do 
  let(:first_name) {"Test"}
  let(:last_name) {"User"}
  let(:user) {FactoryGirl.create(:user, first_name: first_name, last_name: last_name)}
  let(:decorator) {user.decorate}

  describe '.full_name' do
    context 'with first and last name' do
      it 'returns the first and the last name together' do
        expect(decorator.full_name).to eq("#{first_name} #{last_name}")
      end
    end

    context 'whithout first name' do
      before(:each) do
        user.first_name = nil
      end

      it 'correctly formats the full name without a first name' do
        expect(decorator.full_name).to eq("No First Name #{last_name}")
      end
    end

    context 'whithout last name' do
      before(:each) do 
        user.last_name = nil
      end

      it 'correctly formats the full name without a last name' do
        expect(decorator.full_name).to eq("#{first_name} No Last Name")
      end
    end

    context 'whithout first and last name' do
      before(:each) do
        user.first_name = nil
        user.last_name = nil
      end

      it 'formats the full name without first and last name' do
        expect(decorator.full_name).to eq("No First or Last Name")
      end
    end
  end
end