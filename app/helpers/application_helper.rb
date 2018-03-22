module ApplicationHelper
  def format_date(datetime)
    datetime.strftime("%d %b, %Y")
  end
end
