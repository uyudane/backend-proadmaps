# frozen_string_literal: true

class StepSerializer < ActiveModel::Serializer
  attributes :id, :url, :title, :introduction, :required_time, :year, :month, :step_number
end
