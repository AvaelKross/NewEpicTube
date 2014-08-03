require 'spec_helper'
require 'rails_helper'

describe Api::VideosController do
  let(:index_hash_keys) { ["id", "title", "url", "description"] }

  describe "#create" do
    let(:post_video){post :create, format: :json, video: {title: 'how to kill a hamster', description: 'qwe', url: ""}}
    
    it "should return 200 and video data" do
      post_video
      
      expect(response).to be_success
      expect(response.content_type).to eq Mime::JSON
      expect(json_response.keys).to eq index_hash_keys
    end

    it "should create video in db" do
      expect{post_video}.to change{Video.count}.by(1)
    end

  end
end