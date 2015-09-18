require 'rails_helper'

describe UsersController do
  describe 'GET #show' do
    it 'tweetのnicknameがアソシエーションを利用して取得' do
      user = create(:user)

      before do
        login_user user
      end


      it 'can get it' do
        get :show, id: 1

        p response
      end
    end
  end
end