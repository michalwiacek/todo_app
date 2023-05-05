# frozen_string_literal: true

class ItemSerializer < Panko::Serializer
  attributes :id, :todo_list_id, :description, :checked
end
