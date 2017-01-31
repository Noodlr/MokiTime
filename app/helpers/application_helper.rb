module ApplicationHelper
  def status_class(status)
    { 1 => "issue", 2 => "pending", 3 => "pending", 4 => "pending", 5 => "resolved", 6 => "issue", 7 => "issue", 8 => "issue", 9 => "resolved"}[status.id]
  end
end
