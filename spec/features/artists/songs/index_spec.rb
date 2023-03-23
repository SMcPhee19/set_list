# spec/features/artists/songs/index_spec.rb
require 'rails_helper'

RSpec.describe 'Artists songs index' do
  before :each do 
    @prince = Artist.create!(name: 'Prince')
    @purple = @prince.songs.create!(title: 'Purple Rain', length: 123, play_count: 1234545)
    @beret = @prince.songs.create!(title: 'Raspberry Berer', length: 143, play_count: 1234545)
  end
  it 'shows all of the titles of the songs for the artist' do
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content(@purple.title)
    expect(page).to have_content(@beret.title)
  end

  it 'links to each songs show page' do
    visit "/artists/#{@prince.id}/songs"

    click_on @purple.title

    expect(current_path).to eq("/songs/#{@purple.id}")
  end


end