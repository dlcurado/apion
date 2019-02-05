require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  # Convencional, instanciando um objeto do tipo user
  # before { @user = FactoryGirl.build(:user) }

  #it { expect(@user).to respond_to(:email) }
  #it { expect(@user).to respond_to(:name) }
  #it { expect(@user).to respond_to(:password) }
  #it { expect(@user).to respond_to(:password_confirmation) }
  #it { expect(@user).to be_valid }

  # Utilizando Subject
  #subject { build(:user) }
  #it { expect(subject).to respond_to(:email) }
  #it { expect(subject).to be_valid }


  # Outra forma seria referenciando direto o parametros User
  #it { is_expected. to #it { expect(subject).to be_valid } }

  let(:user) { build(:user) }

  it { expect(user).to respond_to(:email) }

  # context 'when name is blank' do
  #   before { user.name = "" }

  #   it { expect(user).not_to be_valid }
  # end

  # context 'when name is nil' do
  #   before { user.name = nil }

  #   it { expect(user).not_to be_valid }
  # end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_confirmation_of(:password) }
  it { is_expected.to allow_value("dlcurado@gmail.com").for(:email) }
end
