class Post < ApplicationRecord
  include PublicActivity::Model
  belongs_to :user
  mount_uploader :attachment, AvatarUploader
  tracked only: [:create, :like], owner: proc { |controller, model| model.user }
end
