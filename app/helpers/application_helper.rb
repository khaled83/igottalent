module ApplicationHelper
  def full_title(page_title)
    title = 'I GOT TALENT'
    title = "#{title} | #{page_title}" if page_title
    return title
  end
end
