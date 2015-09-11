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
      page.must_have_content "Drew242 closed pull request 97 in Drew242/the_pivot"
      page.must_have_content "Drew242 pushed 3 commits to master in Drew242/the_pivot"
      page.must_have_content "RickBacci created branch emails_sent_to_applicant_and_admin_#71_#72 in Drew242/the_pivot"
      page.must_have_content "Drew242 deleted branch bug_permissions in Drew242/the_pivot"
      page.must_have_content "RickBacci closed issue 71 in Drew242/the_pivot"
    end
  end

  # scenario "logout" do
  #   VCR.use_cassette 'feed#logout' do
  #     visit root_path
  #     click_on "Log In"
  #     assert current_user
  #     click_on "Log Out"
  #     refute current_user
  #   end
  # end
end
