class VideoSerializer < ActiveModel::Serializer
  attributes :id, :title, :url, :description
end
