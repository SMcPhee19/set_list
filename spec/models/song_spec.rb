# spec/models/song_spec.rb
require 'rails_helper'

RSpec.describe Song do
  it {should belong_to :artist}
end