require 'rails_helper'


describe User do
  #nicknameが6文字以上の場合は登録できないこと
  describe '#nickname' do
    context '6文字以上の時' do #contextは条件分岐
      it 'valid でないこと' do #itの単位が一つのテスト
        user = User.new(nickname: 'shizuka')
        user.valid?
        expect(user.errors[:nickname]).to be_present
      end
      it 'is invalid without a nickname' do
        user = build(:user, nickname: "")
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end
      it 'is invalid without a email' do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
      # メールアドレスが重複する場合は無効な状態である
      it 'is invalid with a duplicate email address' do
        create(:user,
          email: 'sakura@gmail.com'
        )
        user = build(:user,
          email: 'sakura@gmail.com'
        )
        user.valid?
        expect(user.errors[:email]).to include("has already been taken")
      end
      #tweetsの数を数える
      it 'returns a tweets count' do
        user = create(:user)
        create(:tweet, user: user)
        expect(user.count_tweets).to eq User.count
      end
    end
  end
end