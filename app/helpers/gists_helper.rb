module GistsHelper
  def get_short_question(question)
    question.truncate(25)
  end

  def gist_hash(url)
    url.split('/')[-1]
  end
end
