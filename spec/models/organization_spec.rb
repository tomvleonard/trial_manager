require 'rails_helper'

RSpec.describe Organization, type: :model do

  [ :name, :contact_name, :contact_email, :contact_phone, :street, :city, :state, :postal_code ].each do |attr|
    it { should validate_presence_of attr }
  end

end
