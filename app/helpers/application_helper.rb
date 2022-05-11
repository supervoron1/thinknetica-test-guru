module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(link_name, author, repo)
    link_to link_name, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_class(level)
    bootstrap_alert_class = {
      "success" => "alert-success",
      "error"   => "alert-danger",
      "notice"  => "alert-info",
      "alert"   => "alert-danger",
      "warn"    => "alert-warning"
    }
    bootstrap_alert_class[level] || 'alert-info'
  end
end
