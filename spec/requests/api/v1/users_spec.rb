require 'rails_helper'

RSpec.describe 'Users API request', type: :request do
    let!(:user) { create(:user) }
    let(:user_id) { user.id }

    before { host! 'api.apion.abc' }

    describe 'GET users/:id' do
        before do
            headers = { 'Accept' => 'application/vnd.apion.v1'}
            # get URL, { body }, { headers }
            get "/users/#{user_id}", params: {}, headers: headers
        end

        context 'when the user exists' do
            it 'returns the user' do
                user_response = JSON.parse(response.body, symbolize_names: true)
                expect(user_response[:id]).to eq(user_id)
            end

            it 'returns status 200' do
                expect(response).to have_http_status(200)
            end
        end

        context 'when the user does NOT exists' do
            let(:user_id) { 1000 }
            it 'returns status 404 when the user not exists' do
                expect(response).to have_http_status(404)
            end
        end
    
    
    end

    describe 'POST /users' do
        before do
            headers = { 'Accept' => 'application/vnd.apion.v1'}
            post '/users' , params: { user: user_params }, headers: headers
        end

        context 'when the request params are valid' do
            let(:user_params) { attributes_for(:user) }

            it 'returns status code 201' do
                expect(response).to have_http_status(201)
            end

            it 'returns json data with created user' do
                user_response = JSON.parse(response.body, symbolize_names: true)
                expect(user_response[:email]).to eq(user_params[:email])
            end
        end

        context 'when the request params are invalid' do
            let(:user_params) { attributes_for(:user, email: 'invalid@') }

            it 'return status code 422' do
                expect(response).to have_http_status(422)
            end

            it 'returns the data json for the erros' do
                user_response = JSON.parse(response.body, symbolize_names: true)
                expect(user_response).to have_key(:errors)
            end
        end

    end


    describe 'PUT /user/:id' do
        before do
            headers = { 'Accept' => 'application/vnd.apion.v1'}
            put "/users/#{user_id}" , params: { user: user_params }, headers: headers
        end

        context 'when the request params are valid' do
            let(:user_params) { { email: 'novoemail@gmail.com' } }

            it 'returns status code 200' do
                expect(response).to have_http_status(200)
            end

            it 'returns json data for updated user' do
                user_response = JSON.parse(response.body, symbolize_names: true)
                expect(user_response[:email]).to eq(user_params[:email])
            end
        end

        context 'when the request params are invalid' do
            let(:user_params) { attributes_for(:user, email: 'invalid@') }

            it 'return status code 422' do
                expect(response).to have_http_status(422)
            end

            it 'returns the data json for the erros' do
                user_response = JSON.parse(response.body, symbolize_names: true)
                expect(user_response).to have_key(:errors)
            end
        end
    
    end

end
