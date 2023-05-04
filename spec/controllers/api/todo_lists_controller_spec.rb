# frozen_string_literal: true

require "rails_helper"

RSpec.describe Api::TodoListsController do
  describe "GET #index" do
    before { create_list(:todo_list, 2) }

    it "is success" do
      get :index
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body.length).to eq(2)
    end
  end

  describe "GET #show" do
    let(:todo_list) { create(:todo_list) }

    it "is success" do
      get :show, params: { id: todo_list.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST #create" do
    it "creates a new todo list on success" do
      expect { post :create, params: { todo_list: { title: "My list" } } }.to change(TodoList, :count).by(1)
      expect(response).to have_http_status(:ok)
    end

    it "does not create any new todo lists on failure" do
      allow_any_instance_of(TodoList).to receive(:save).and_return(false)
      expect { post :create, params: { todo_list: { title: "" } } }.not_to change(TodoList, :count)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PATCH #update" do
    let(:todo_list) { create(:todo_list) }

    it "updates a todo lists on success" do
      patch :update, params: { id: todo_list.id, todo_list: { title: "new title" } }
      expect(response).to have_http_status(:ok)
      todo_list.reload
      expect(todo_list.title).to eq("new title")
    end

    it "does not update any todo lists on failure" do
      allow_any_instance_of(TodoList).to receive(:update).and_return(false)
      patch :update, params: { id: todo_list.id, todo_list: { title: "" } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "DELETE #destroy" do
    let!(:todo_list) { create(:todo_list) }

    it "deletes a todo lists on success" do
      expect { delete :destroy, params: { id: todo_list.id } }.to change(TodoList, :count).by(-1)
      expect(response).to have_http_status(:ok)
    end

    it "does not delete any todo lists on failure" do
      allow_any_instance_of(TodoList).to receive(:destroy).and_return(false)
      expect { delete :destroy, params: { id: todo_list.id } }.not_to change(TodoList, :count)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
