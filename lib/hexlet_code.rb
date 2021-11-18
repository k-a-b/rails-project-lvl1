# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'

module HexletCode
  class Error < StandardError; end

  def self.form_for(user, url: '#', &block)
    params = {
      action: url,
      method: 'post'
    }

    HexletCode::Tag.build('form', params)
  end
end
