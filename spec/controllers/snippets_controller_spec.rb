require "rails_helper"

RSpec.describe SnippetsController, type: :controller do


  describe "create" do 


    context "with valid params" do 


      it "saves a record in the database" do 
        valid_params = {snippet: { title: "Random", body: "random body"}}

        expect { post :create, valid_params }.to change { Snippet.count }.by 1
      end
      it "redirects to root path" do 
        valid_params = {snippet: { title: "Random", body: "random body"}}
        post :create, valid_params
        expect(response).to redirect_to root_path
      end
    end

    context "with invalid params" do 
      it "does not save to the database" do 
        invalid_params = {snippet: { title: "Random"}}
        expect { post :create, invalid_params }.to_not change { Snippet.count }
      end

      it "renders create snippet page" do 
        invalid_params = {snippet: { title: "Random"}}
        post :create, invalid_params
        expect(response).to render_template :new
      end
    end

  end

end 