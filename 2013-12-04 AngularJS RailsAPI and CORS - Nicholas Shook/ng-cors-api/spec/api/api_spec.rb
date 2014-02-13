require 'spec_helper_full'

describe 'API' do
  include Rack::Test::Methods

  let(:guest) { User.create(username: 'blah', uid: '42') }

  describe 'GET /users', :all_tasks do
    context "when not authenticated" do
      it 'returns 403 with no authentication_token' do
        get '/users'
        expect(last_response.status).to eq 403
        expect(last_response.body).to match /What do you think/
      end
      it 'returns 403 with fake authentication_token' do
        get "/users?token=1"
        expect(last_response.status).to eq 403
      end
    end
    context 'when authenticated' do
      it "gets a list of users' usernames" do
        get "/users", params: {token: guest.authentication_token}
        expect(last_response.status).to eq 200
        expect(last_response.body).to eq User.all.pluck('username')
      end
    end
  end
end
