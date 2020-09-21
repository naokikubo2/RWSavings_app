require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  context '正常データを入力' do
    it '正常' do
      expect(@user.valid?).to eq(true)
    end
  end

  context 'nameが空欄' do
    it '無効' do
      @user.name = ''
      @user.valid?
      expect(@user.valid?).to eq(false)
    end
  end

  context 'emailが空欄' do
    it '無効' do
      @user.email = ''
      @user.valid?
      expect(@user.valid?).to eq(false)
    end
  end

  context 'passwordが空欄' do
    it '無効' do
      @user.password = ''
      expect(@user.valid?).to eq(false)
    end
  end
  context '重複したemail' do
    it '無効' do
      @user2 = create(:user)
      @user.valid?
      expect(@user.errors[:email]).to include('has already been taken')
    end
  end

  describe '境界値' do
    it 'nameの長さが50で正常' do
      @user.name = 'a' * 50
      expect(@user.valid?).to eq(true)
    end
    it 'nameの長さが51で異常' do
      @user.name = 'a' * 51
      expect(@user.valid?).to eq(false)
    end
    it 'emailの長さが255で正常' do
      @user.email = 'a' * 246 + '@aaa.com'
      expect(@user.valid?).to eq(true)
    end
    it 'emailの長さが256で異常' do
      @user.email = 'a' * 256
      expect(@user.valid?).to eq(false)
    end
    it 'passwordの長さが5で異常' do
      @user.password = 'a' * 5
      expect(@user.valid?).to eq(false)
    end
    it 'passwordの長さが6で正常' do
      @user.password = 'a' * 6
      expect(@user.valid?).to eq(true)
    end
  end

  context 'emailに@がない' do
    it '無効' do
      @user.password = 'asdf.com'
      expect(@user.valid?).to eq(false)
    end
  end
  context 'emailに.がない' do
    it '無効' do
      @user.password = 'asdf@com'
      expect(@user.valid?).to eq(false)
    end
  end
end
