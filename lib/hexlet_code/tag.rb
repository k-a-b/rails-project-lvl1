# frozen_string_literal: true
require 'pry'

module HexletCode
  class Tag
    PAIRED_TAGS = %w[
      label
      div
      a
      html
    ]
    def self.build(tag_name, **params, &block)
      new(tag_name, **params, &block).build_tag
    end

    attr_reader :tag_name, :params, :block

    def initialize(tag_name, **params, &block)
      @tag_name = tag_name
      @params = params
      @block = block&.call
    end

    def build_tag
      arr = ['<']
      arr << tag_name
      arr << attrs
      arr << '>'
      arr << block if block
      arr << close_tag if paired_tag
      arr.compact.join
    end

    private

    def attrs
      params.map{ |k, v| " #{k}=\'#{v}\'" }.join.gsub("'", '"')
    end

    def close_tag
      "</#{tag_name}>"
    end

    def paired_tag
      PAIRED_TAGS.include? tag_name
    end
  end
end
