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
        f.input :name
      end
    end

    let(:expected_tag) do
      '<form action="#" method="post"><label for="name">' \
        'Name</label><input name="name" type="text" value="rob"></form>'
    end

    it 'generate tags' do
      expect(subject).to eq(expected_tag)
    end
  end
end
