# spec/models/artist_spec.rb
require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}

  describe 'instance methods' do 
    describe '#average_song_length'do
    before :each do 
      @prince = Artist.create!(name: 'Prince')
      @purple = @prince.songs.create!(title: 'Purple Rain', length: 123, play_count: 1234545)
      @beret = @prince.songs.create!(title: 'Raspberry Berer', length: 143, play_count: 1234545)
      @other_song = @prince.songs.create!(title: 'Raspberry Berer', length: 1, play_count: 1234545)
    end

      it 'returns the average song length' do
        expect(@prince.average_song_length.round(2)).to eq(0.89e2)
      end
    end
  end
end