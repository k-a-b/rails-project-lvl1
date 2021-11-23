# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/tag'
require 'pry'

module HexletCode
  class Error < StandardError; end
  @user_attributes ||= []

  def self.form_for(user, url: '#')
    @user = user

    params = {
      action: url,
      method: 'post'
    }

    user_attrs = yield self

    HexletCode::Tag.build('form', params) { build_inside_tags(user_attrs) }
  end

  def self.input(title, as: nil)
    value = @user.public_send(title)

    type =
      case as
      when :text
        @user[title].is_a?(String) ? 'textarea' : raise(WrongFormatError)
      else
        'input'
      end

    @user_attributes << { title => title.capitalize, type: 'label' } if type == 'input'
    @user_attributes << { title => value, type: type }
  end

  def self.build_inside_tags(attributes)
    return unless attributes

    attributes.map do |attribute|
      type = attribute.delete(:type)

      HexletCode::Tag.build(type, attribute)
    end
  end

  def self.submit(action = nil)
    @user_attributes << { commit: (action || 'Save'), type: 'input' }
  end
end
