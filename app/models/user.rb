class User < ActiveRecord::Base
  def self.service
    @service = GithubService.new
  end

  def self.find_or_create_from_oauth(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)

    user.email      = data.info.email
    user.nickname   = data.info.nickname
    user.image_url  = data.info.image
    user.token      = data.credentials.token
    user.save

    user
  end

  def following
    service.following
  end

  def followers
    service.followers
  end
end
