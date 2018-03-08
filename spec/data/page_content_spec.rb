require 'spec_helper'

RSpec.describe PageContent do
  before do
      PageContent.source_data = <<~yaml
        index:
          title: some title
      yaml
  end

  describe '.load!' do
    it 'stores the contents of page_content.yml in an instance variable' do
      expect(PageContent.instance[:index]).to eq('title' => 'some title')
    end
  end

  describe '.get' do
    it 'gets the page content indifferent access' do
      expect(PageContent.get_page(:index)).to be_an_instance_of(HashWithIndifferentAccess)
      expect(PageContent.get_page(:index)[:title]).to eq('some title')
    end
  end
end