require 'rails_helper'

RSpec.describe UserOrganization, type: :model do

  [ :user, :organization ].each do |assoc|
    it { should belong_to assoc }
  end

end
