FactoryGirl.define do
  factory :admin do
    sequence(:first_name) { |n| "Admin#{n}" }
    sequence(:last_name) { |n| "McAdminheimer#{n}" }
    sequence(:email) { |n| "admin_mcadminheimer#{n}@gmail.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :user do
    sequence(:first_name) { |n| "User#{n}" }
    sequence(:last_name) { |n| "McUsenheimer#{n}" }
    sequence(:email) { |n| "user_mcusenheimer#{n}@gmail.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :organization do
    sequence(:name) { |n| "Organization Number #{n}" }
    sequence(:contact_name) { |n| "Orga Mcnization#{n}" }
    sequence(:contact_email) { |n| "organization_number_#{n}@gmail.com" }
    contact_phone '617-123-0001'
    sequence(:street) { |n| "#{n} Main Street" }
    city 'Exeter'
    state 'NH'
    postal_code '09876'
  end

  factory :user_organization do
    user
    organization
  end

  factory :user_organization_administrator, parent: :user_organization do
    administrator true
  end

  factory :user_organization_trial_secretary, parent: :user_organization do
    trial_secretary true
  end
end
