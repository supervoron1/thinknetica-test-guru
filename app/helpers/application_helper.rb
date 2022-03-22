module ApplicationHelper
  def current_year
    Time.now.year
  end

  def github_url(link_name, author, repo)
    link_to link_name, "https://github.com/#{author}/#{repo}", target: '_blank'
  end
end
