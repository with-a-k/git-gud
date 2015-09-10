class GithubService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.github.com")
  end

  def count_following(user)
    user_data(user)["following"]
  end

  def count_followers(user)
    user_data(user)["followers"]
  end

  def get_organizations(user)
    byebug
    parse(connection.get("/users/#{user.nickname}/orgs?access_token=#{user.token}"))
  end

  def get_number_starred(user)
    parse(connection.get("/user/starred?access_token=#{user.token}")).count
  end

  def user_data(user)
    parse(connection.get("/user?access_token=#{user.token}"))
  end

  def user_repositories(user)
    parse(connection.get("/users/#{user.nickname}/repos?access_token=#{user.token}"))
  end

  private

  def parse(response)
    JSON.parse(response.body)
  end
end