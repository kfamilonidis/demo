
RSpec.shared_context 'authorized request' do
  let(:user) { create(:user) }
  let(:valid_token) { JwtService.encode({ user_id: user.id }) }
  let(:headers) { { 'Authorization' => "Bearer #{valid_token}" } }
end
