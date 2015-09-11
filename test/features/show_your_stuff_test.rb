require "test_helper"

feature "ShowYourStuff" do
  scenario "starred" do
    VCR.use_cassette 'you#starred' do
      visit root_path
      page.must_have_content "Git Gud"
      click_on "Log In"
      click_on "with-a-k"
      page.must_have_content "stevekinney/octavian"
    end
  end

  scenario "contributions" do
    VCR.use_cassette 'you#contributions' do
      visit root_path
      click_on "Log In"
      click_on "with-a-k"
      page.must_have_content "Contributions"
      page.must_have_content "Today:"
      page.must_have_content "Streak: 4"
      page.must_have_content "Record Streak: 4"
      page.must_have_content "This Year:"
    end
  end

  scenario "activity" do
    VCR.use_cassette 'you#activity' do
      visit root_path
      click_on "Log In"
      click_on "with-a-k"
      page.must_have_content "Your Activity"
      page.must_have_content "with-a-k closed issue 8 in with-a-k/git-gud"
      page.must_have_content "with-a-k pushed 1 commit to master in with-a-k/git-gud"
      page.must_have_content "with-a-k pushed 2 commits to master in with-a-k/git-gud"
      page.must_have_content "with-a-k closed pull request 19 in with-a-k/git-gud"
    end
  end

  scenario "follows" do
    VCR.use_cassette 'you#follows' do
      visit root_path
      click_on "Log In"
      click_on "with-a-k"
      page.must_have_content "You Follow:"
      page.must_have_content "RMCornell"
      page.must_have_content "Follow You"
    end
  end
end
