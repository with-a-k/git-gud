require "test_helper"

feature "FeedBasics" do
  scenario "navbar content" do
    VCR.use_cassette 'feed#navbar' do
      visit root_path
      page.must_have_content "Git Gud"
      click_on "Log In"
      page.must_have_content "followers. You are following"
    end
  end

  scenario "repositories" do
    VCR.use_cassette 'feed#repositories' do
      visit root_path
      click_on "Log In"
      page.must_have_content "git-gud"
    end
  end

  scenario "activity" do
    VCR.use_cassette 'feed#activity' do
      visit root_path
      click_on "Log In"
      # expect to see activity
    end
  end

  scenario "locked out to unauthenticated users" do
    VCR.use_cassette 'feed#security' do
      visit feed_path
      # force the authentication to fail?
      # expect to be at a Forbidden or Not Found pagevisit
    end
  end
end
