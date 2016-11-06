require 'spec_helper'
require 'rails_helper'

describe Book do
  describe 'Update Search Count' do
    context 'with valid key' do
      it 'should call update count ' do
        book = double("Book")
        expect(Book).to receive(:update_search_count) 
        Book.update_search_count(book)
      end
    end
    end
end
