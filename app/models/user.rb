class User < ActiveRecord::Base
  def service
    GithubService.new
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
    service.count_following(self)
  end

  def users_following
    service.following(self)
  end

  def followers
    service.count_followers(self)
  end

  def user_followers
    service.followers(self)
  end

  def organizations
    service.get_organizations(self)
  end

  def starred
    service.get_starred(self)
  end

  def number_starred
    service.get_number_starred(self)
  end

  def repositories
    service.user_repositories(self)
  end

  def events
    service.get_events(self).map { |event| Event.new(event) }
  end

  def owned_events
    service.get_your_events(self).map { |event| Event.new(event) }
  end

  def stats
    GithubStats.new(self.nickname) 
  end

  def year_contributions
    stats.data.scores.reduce(&:+)
  end

  def day_contributions
    stats.data.scores.last
  end

  def longest_streak
    stats.longest_streak.count
  end

  def current_streak
    stats.streak.count
  end
end
