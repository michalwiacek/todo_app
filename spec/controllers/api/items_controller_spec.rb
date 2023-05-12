# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::ItemsController do
  let(:user) { create(:user) }
  let(:todo_list) { create(:todo_list, user:) }

  describe "GET #index" do
    before do
      user_login(user)
      create_list(:item, 2, todo_list:)
    end

    it "is success" do
      get :index, params: { todo_list_id: todo_list.id }
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body.length).to eq(2)
    end
  end

  describe "POST #create" do
    before { user_login(user) }

    it "creates a new item on success" do
      expect do
        post :create, params: { todo_list_id: todo_list.id, description: "My item" }
      end.to change(Item, :count).by(1)
      expect(response).to have_http_status(:ok)
    end

    it "does not create any new items on failure" do
      allow_any_instance_of(Item).to receive(:save).and_return(false)
      expect do
        post :create, params: { todo_list_id: todo_list.id, description: "" }
      end.not_to change(Item, :count)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PATCH #update" do
    let(:item) { create(:item, todo_list:) }

    before { user_login(user) }

    it "updates an item on success" do
      patch :update, params: { id: item.id, todo_list_id: todo_list.id, description: "new description" }
      expect(response).to have_http_status(:ok)
      item.reload
      expect(item.description).to eq("new description")
    end

    it "does not update any items on failure" do
      allow_any_instance_of(Item).to receive(:update).and_return(false)
      patch :update, params: { id: item.id, todo_list_id: todo_list.id, description: "" }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "DELETE #destroy" do
    let!(:item) { create(:item, todo_list:) }

    before { user_login(user) }

    it "deletes an item on success" do
      expect do
        delete :destroy, params: { id: item.id, todo_list_id: todo_list.id }
      end.to change(Item, :count).by(-1)
      expect(response).to have_http_status(:ok)
    end

    it "does not delete any items on failure" do
      allow_any_instance_of(Item).to receive(:destroy).and_return(false)
      expect do
        delete :destroy, params: { id: item.id, todo_list_id: todo_list.id }
      end.not_to change(Item, :count)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
