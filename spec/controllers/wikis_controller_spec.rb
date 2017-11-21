require 'rails_helper'
require 'database_cleaner'
include RandomData

RSpec.describe WikisController, type: :controller do

DatabaseCleaner.cleaning do

  let(:my_wiki) { Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
  let(:user) { User.create!(email:"test@email.com", password:"tomandjerry")}
 

  describe "GET #index" do
    it "returns http success" do
      login_with(user)
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_wiki] to @wikis" do
      login_with(user)
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end
  end

  describe "GET new" do
    it "returns http success" do
      login_with(user)
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      login_with(user)
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @wiki" do
      login_with(user)
      get :new
      expect(assigns(:wiki)).not_to be_nil
    end
  end

    describe "POST create" do
      it "increases the number of Wiki by 1" do
        login_with(user)
        expect { post :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Wiki,:count).by(1)
      end

      it "assigns the new wiki to @wiki" do
        login_with(user)
        post :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
        expect(assigns(:wiki)).to eq Wiki.last
      end

      it "redirects to the new post" do
        login_with(user)
        post :create, params: { wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
        expect(response).to redirect_to Wiki.last
      end
    end

    describe "GET show" do
      it "returns http success" do
        login_with(user)
        get :show, params: { id: my_wiki.id }
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        login_with(user)
        get :show, params: { id: my_wiki.id }
        expect(response).to render_template :show
      end

      it "assigns my_wiki to @wiki" do
        login_with(user)
        get :show, params: { id: my_wiki.id }
        expect(assigns(:wiki)).to eq(my_wiki)
      end
    end

    describe "GET edit" do
      it "returns http success" do
        login_with(user)
        get :edit, params: { id: my_wiki.id }
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        login_with(user)
        get :edit, params: { id: my_wiki.id }
        expect(response).to render_template :edit
      end

      it "assigns wiki to be updated to @wiki" do
        login_with(user)
        get :edit, params: { id: my_wiki.id }
        wiki_instance = assigns(:wiki)

        expect(wiki_instance.id).to eq my_wiki.id
        expect(wiki_instance.title).to eq my_wiki.title
        expect(wiki_instance.body).to eq my_wiki.body
      end
    end

    describe "PUT update" do
      it "updates wiki with expected attributes" do
        login_with(user)
        new_title = RandomData.random_sentence
        new_body = RandomData.random_paragraph

        put :update, params: { id: my_wiki.id, wiki: { title: new_title, body: new_body } }

        updated_wiki = assigns(:wiki)
        expect(updated_wiki.id).to eq my_wiki.id
        expect(updated_wiki.title).to eq new_title
        expect(updated_wiki.body).to eq new_body
      end

      it "redirects to the updated wiki" do
        login_with(user)
        new_title = RandomData.random_sentence
        new_body = RandomData.random_paragraph

        put :update, params: { id: my_wiki.id, wiki: { title: new_title, body: new_body } }
        expect(response).to redirect_to my_wiki
      end
    end

    describe "DELETE destroy" do
      it "deletes the wiki" do
        login_with(user)
        delete :destroy, params: { id: my_wiki.id }
        count = Wiki.where({id: my_wiki.id}).size
        expect(count).to eq 0
      end

      it "redirects to wiki index" do
        login_with(user)
        delete :destroy, params: { id: my_wiki.id }
        expect(response).to redirect_to wikis_path
      end
    end
    

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # 
  end

end
