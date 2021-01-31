require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録 ' do
    it 'nicknameが空では保存できない' do
      user = User.new(nickname: '', email: 'test@example', password: '0000000', password_confirmation: '0000000', first_name: 'やまだ',
                      last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birth: '1996-12-23')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では保存できない' do
      user = User.new(nickname: 'a', email: '', password: 'a000000', password_confirmation: 'a000000', first_name: 'やまだ', last_name: '太郎',
                      first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birth: '1996-12-23')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'birthが空では保存できない' do
      user = User.new(nickname: 'a', email: 'test@example', password: 'a000000', password_confirmation: 'a000000', first_name: 'やまだ',
                      last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birth: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birth can't be blank")
    end
    it 'passwordが空では保存できない' do
      user = User.new(nickname: 'a', email: 'test@example', password: '', password_confirmation: 'a111111', first_name: 'やまだ',
                      last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birth: '1996-12-23')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank",
                                                   'Password is invalid',
                                                   'Password is too short (minimum is 6 characters)',
                                                   "Password confirmation doesn't match Password")
    end
    it 'passwordが半角英数字混合でなければ保存できない' do
      user = User.new(nickname: 'a', email: 'test@example', password: '1111111', password_confirmation: '1111111', first_name: 'やまだ',
                      last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birth: '1996-12-23')
      user.valid?
      expect(user.errors.full_messages).to include('Password is invalid')
    end
    it 'password_confimationが空では保存できない' do
      user = User.new(nickname: 'a', email: 'test@example', password: 'a111111', password_confirmation: '', first_name: 'ヤマダ',
                      last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birth: '1996-12-23')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'first_nameが空では保存できない' do
      user = User.new(nickname: 'a', email: 'test@example', password: 'a111111', password_confirmation: 'a111111', first_name: '',
                      last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birth: '1996-12-23')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
    end
    it 'first_nameは全角（漢字・ひらがな・カタカナ）での入力でないと保存できない' do
      user = User.new(nickname: 'a', email: 'test@example', password: 'a111111', password_confirmation: 'a111111', first_name: '11',
                      last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birth: '1996-12-23')
      user.valid?
      expect(user.errors.full_messages).to include('First name is invalid')
    end
    it 'last_nameが空では保存できない' do
      user = User.new(nickname: 'a', email: 'test@example', password: 'a111111', password_confirmation: 'a111111', first_name: 'ヤマダ',
                      last_name: '', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birth: '1996-12-23')

      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
    end
    it 'last_nameは全角（漢字・ひらがな・カタカナ）での入力でないと保存できない' do
      user = User.new(nickname: 'a', email: 'test@example', password: 'a111111', password_confirmation: 'a111111', first_name: 'ヤマダ',
                      last_name: '111', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', birth: '1996-12-23')
      user.valid?
      expect(user.errors.full_messages).to include('Last name is invalid')
    end
    it 'first_name_kanaがカタカナ以外ではでは保存できない' do
      user = User.new(nickname: 'a', email: 'test@example', password: 'a000000', password_confirmation: 'a000000', first_name: 'やまだ',
                      last_name: '太郎', first_name_kana: 'やまだ', last_name_kana: 'タロウ', birth: '1996-12-23')
      user.valid?
      expect(user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'first_name_kanaが空ではでは保存できない' do
      user = User.new(nickname: 'a', email: 'test@example', password: 'a000000', password_confirmation: 'a000000', first_name: 'やまだ',
                      last_name: '太郎', first_name_kana: '', last_name_kana: 'タロウ', birth: '1996-12-23')
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid')
    end

    it 'last_name_kanaがカタカナ以外ではでは保存できない' do
      user = User.new(nickname: 'a', email: 'test@example', password: 'a000000', password_confirmation: 'a000000', first_name: 'やまだ',
                      last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: 'たろう', birth: '1996-12-23')
      user.valid?
      expect(user.errors.full_messages).to include('Last name kana is invalid')
    end
    it 'last_name_kanaが空では保存できない' do
      user = User.new(nickname: 'a', email: 'test@example', password: 'a000000', password_confirmation: 'a000000', first_name: 'やまだ',
                      last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: '', birth: '1996-12-23')
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana is invalid')
    end
  end
end
