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
  it { is_expected. to respond_to(:email) }
end
