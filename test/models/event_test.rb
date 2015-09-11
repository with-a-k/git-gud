require './test/test_helper'

class EventTest < Minitest::Test
  def test_its_basic_properties_are_accessible
    event = Event.new({
                "type" => "Event",
                "public" => true,
                "payload" => {
                },
                "repo" => {
                  "name" => "octocat/Hello-World"
                },
                "actor" => {
                  "login" => "octocat",
                  "avatar_url" => "https://github.com/images/error/octocat_happy.gif",
                },
                "created_at" => "2011-09-06T17:26:27Z",
                "id" => "12345"
              })

    assert_equal "Event", event.type
    assert_equal "octocat/Hello-World", event.repo_name
    assert_equal "octocat", event.actor_name
  end

  def test_a_pull_request_event_properties_are_accessible
    event = Event.new({
                        "type" => "PullRequestEvent",
                        "public" => true,
                        "payload" => {
                          "action" => "opened",
                          "number" => 5
                        },
                        "repo" => {
                          "name" => "Unused Data"
                        },
                        "actor" => {
                          "login" => "prisken"
                        }
                      })
    assert_equal "PullRequestEvent", event.type
    assert_equal "opened", event.action
    assert_equal 5, event.number
  end

  def test_an_issue_event_properties_are_accessible
    event = Event.new({
                        "type" => "IssuesEvent",
                        "public" => true,
                        "payload" => {
                          "action" => "assigned",
                          "issue" => {
                            "number" => 8,
                            "body" => "Need some help here!"
                            },
                          "assignee" => "engineer"
                        },
                        "repo" => {
                          "name" => "Unused Data"
                        },
                        "actor" => {
                          "login" => "sniper"
                        }
                      })
    assert_equal "IssuesEvent", event.type
    assert_equal "assigned", event.action
    assert_equal 8, event.issue_number
    assert_equal "Need some help here!", event.issue_body
    assert_equal "engineer", event.assignee
  end

  def test_a_delete_event_properties_are_accessible
    event = Event.new({
                        "type" => "DeleteEvent",
                        "public" => true,
                        "payload" => {
                          "ref" => "forked-branch",
                          "ref_type" => "branch"
                        },
                        "repo" => {
                          "name" => "Unused Data"
                        },
                        "actor" => {
                          "login" => "Unused Data"
                        }
                      })
    assert_equal "DeleteEvent", event.type
    assert_equal "forked-branch", event.ref
    assert_equal "branch", event.ref_type
  end

  def test_a_create_event_properties_are_accessible
    event = Event.new({
                        "type" => "CreateEvent",
                        "public" => true,
                        "payload" => {
                          "ref" => "null",
                          "ref_type" => "repository"
                        },
                        "repo" => {
                          "name" => "a-new-repo"
                        },
                        "actor" => {
                          "login" => "Unused Data"
                        }
                      })
    assert_equal "CreateEvent", event.type
    assert_equal "null", event.ref
    assert_equal "repository", event.ref_type
  end

  def test_a_push_event_properties_are_accessible
    event = Event.new({
                        "type" => "PushEvent",
                        "public" => true,
                        "payload" => {
                          "ref" => "refs/heads/branchname",
                          "size" => 17
                        },
                        "repo" => {
                          "name" => "an-existing-repo"
                        },
                        "actor" => {
                          "login" => "Unused Data"
                        }
                      })
    assert_equal "PushEvent", event.type
    assert_equal "branchname", event.push_ref
    assert_equal 17, event.size
  end
end