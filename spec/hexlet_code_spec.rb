# frozen_string_literal: true

RSpec.describe HexletCode do
  it 'has a version number' do
    expect(HexletCode::VERSION).not_to be nil
  end

  describe '.form_for' do
    let(:user_templ) { Struct.new(:name, :job, keyword_init: true) }
    let(:user) { user_templ.new(name: 'rob') }

    subject do
      described_class.form_for user do |f|
      end
    end

    let(:expected_tag) { '<form action="#" method="post"></form>' }

    it 'generate tags' do
      expect(subject).to eq(expected_tag)
    end
  end
end
