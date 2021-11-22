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
      arr << block
      arr << params.values.join if tag_name == 'textarea'
      arr << close_tag if paired_tag
      arr.compact.join
    end

    private

    def attrs
      return unless params
      return input_attrs if tag_name == 'input'
      return text_area_attrs if tag_name == 'textarea'

      params.map { |k, v| " #{k}=\"#{v}\"" }.join
    end

    def input_attrs
      params.map { |k, v| " name=\"#{k}\" type=\"text\" value=\"#{v}\"" }.join
    end

    def text_area_attrs
      params.map { |k, _v| " cols=\"20\" rows=\"40\" name=\"#{k}\"" }.join
    end

    def close_tag
      "</#{tag_name}>"
    end

    def paired_tag
      PAIRED_TAGS.include? tag_name
    end
  end
end
