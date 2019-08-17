# frozen_string_literal: true

RSpec.describe SharesController, type: :controller do
  let(:user) { create(:user) }

  shared_examples_for 'returns status with render' do |status, template|
    it "returns #{status} status" do
      expect(response).to have_http_status(status)
    end

    it 'render template' do
      expect(response).to render_template(template)
    end
  end

  describe 'GET /shares' do
    let(:params) { {} }

    before { get :index, params: params }

    it_behaves_like 'returns status with render', :ok, :index

    context 'when there is no shares data' do
      it 'returns empty array' do
        expect(assigns[:shares]).to be_empty
      end
    end

    context 'when there is shares data' do
      let!(:share) { create(:share, user_id: user.id) }

      context 'when there is no parameters' do
        it 'returns an arrays of shares' do
          expect(assigns[:shares]).to eq([share])
        end
      end

      context 'when there is parameters' do
        context 'when page is exists' do
          let(:params) { { page: 1 } }

          it 'returns an arrays of shares' do
            expect(assigns[:shares]).to eq([share])
          end
        end

        context 'when page does not exists' do
          let(:params) { { page: 2 } }

          it 'returns an empty array' do
            expect(assigns[:shares]).to be_empty
          end
        end
      end
    end
  end

  describe 'POST /shares' do
    let(:share_attribute) { attributes_for(:share) }
    let(:params) do
      {
        share: share_attribute
      }
    end

    context 'when user not logged in yet' do
      it 'redirect to sign page' do
        post :create, params: params
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user logged in' do
      before { sign_in(user) }

      context 'when params is valid' do
        it 'returns ok http status' do
          post :create, params: params
          expect(response).to have_http_status(302)
        end

        it 'redirects to show page' do
          post :create, params: params
          expect(response).to redirect_to(share_path(assigns[:share]))
        end

        it 'creates a share with given attributes', :aggregate_failures do
          expect { post :create, params: params }.to change { user.shares.count }.from(0).to(1)

          share = user.shares.first
          expect(share.url).to eq share_attribute[:url]
          expect(share.title).to eq share_attribute[:title]
          expect(share.description).to eq share_attribute[:description]
        end

        it 'set flash[:notice] message' do
          post :create, params: params
          expect(flash[:notice]).to eq('Share was successfully created.')
        end
      end

      context 'when params is invalid' do
        let(:params) do
          {
            share: {
              title: share_attribute[:title],
              description: share_attribute[:description],
              url: youtube_url
            }
          }
        end
        let(:youtube_url) { nil }

        before { post :create, params: params }

        context 'when missing params' do
          it_behaves_like 'returns status with render', 200, :new

          it 'returns share with errors' do
            share = assigns[:share]

            expect(share.errors).to_not be_empty
            expect(share.errors.messages[:url]).to_not eq "can't be blank"
          end
        end

        context 'when url does not match youtube format' do
          let(:youtube_url) { 'https://github.com/rubocop-hq/rspec-style-guide' }

          it 'returns share with errors wrong format' do
            share = assigns[:share]

            expect(share.errors).to_not be_empty
            expect(share.errors.messages[:url]).to_not eq "is not youtube url"
          end
        end
      end
    end
  end
end
