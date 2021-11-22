# frozen_string_literal: true

module HexletCode
  class Tag
    PAIRED_TAGS = %w[
      label
      div
      a
      html
      form
      textarea
      div
      label
    ].freeze

    def self.build(tag_name, params = nil, &block)
      new(tag_name, params, &block).build_tag
    end

    attr_reader :tag_name, :params, :block

    def initialize(tag_name, params = nil, &block)
      @tag_name = tag_name.to_s
      @params = params
      @block = block&.call
    end

    def build_tag
      arr = ["<#{tag_name}"]
      arr << attrs
      arr << '>'
      arr << body
      arr << close_tag if paired_tag
      arr.compact.join
    end

    private

    def attrs
      return unless params

      case tag_name.to_s
      when 'input' then input_attrs
      when 'textarea' then textarea_attrs
      when 'label' then label_attrs
      else standart_attrs
      end
    end

    def body
      return block if block

      params.values.join if %w[textarea label].include? tag_name
    end

    def input_attrs
      params.map { |k, v| " name=\"#{k}\" type=\"#{input_type(k)}\"" + (v ? " value=\"#{v}\"" : '') }.join
    end

    def input_type(input_name)
      return 'submit' if input_name.to_s == 'commit'

      'text'
    end

    def textarea_attrs
      params.map { |k, _v| " cols=\"20\" rows=\"40\" name=\"#{k}\"" }.join
    end

    def label_attrs
      params.map { |k, _v| " for=\"#{k}\"" }.join
    end

    def standart_attrs
      params.map { |k, v| " #{k}=\"#{v}\"" }.join
    end

    def close_tag
      "</#{tag_name}>"
    end

    def paired_tag
      PAIRED_TAGS.include? tag_name
    end
  end
end
