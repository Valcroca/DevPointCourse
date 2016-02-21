require 'spec_helper'

describe WordifyJakesorce do
 it 'has a version number' do
   expect(WordifyJakesorce::VERSION).not_to be nil
 end

 it 'spaces a string' do 
   expect(WordifyJakesorce.spacify("hello", 1)).to eq('h e l l o')
 end

 it 'reverses a string' do
   expect(WordifyJakesorce.reversify("my string")).to eq("gnirts ym")
 end

end