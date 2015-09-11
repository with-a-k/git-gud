class Event
  attr_reader :type,
              :actor_name,
              :repo_name,
              :action,
              :number,
              :issue_number,
              :issue_body,
              :assignee,
              :ref,
              :ref_type,
              :push_ref,
              :size

  def initialize(event_data)
    @type         = event_data["type"]
    @actor_name   = event_data["actor"]["login"]
    @repo_name    = event_data["repo"]["name"]
    @action       = event_data["payload"]["action"]
    @number       = event_data["payload"]["number"] if type == "PullRequestEvent"
    @issue_number = event_data["payload"]["issue"]["number"] if type == "IssuesEvent"
    @assignee     = event_data["payload"]["assignee"] if type == "IssuesEvent"
    @issue_body   = event_data["payload"]["issue"]["body"] if type == "IssuesEvent"
    @ref          = event_data["payload"]["ref"] if type == "DeleteEvent" || type == "CreateEvent"
    @ref_type     = event_data["payload"]["ref_type"] if type == "DeleteEvent" || type == "CreateEvent"
    @push_ref     = event_data["payload"]["ref"].split("/").last if type == "PushEvent"
    @size         = event_data["payload"]["size"] if type == "PushEvent"
  end
end