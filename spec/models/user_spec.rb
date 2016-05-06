require 'rails_helper'

RSpec.describe User, type: :model do

  [ :first_name, :last_name ].each do |attr|
    it { should validate_presence_of attr }
  end

end
