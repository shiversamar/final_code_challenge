
require 'rails_helper'

RSpec.describe Post, type: :model do

  before(:all)do
    @post = Post.new(body:"First Body", title:"First Title")
  end

  it "should have a matching body" do
    expect(@post.body).to eq("First Body")
  end

  it "should have a matching title" do
    expect(@post.title).to eq("First Title")
  end
end
