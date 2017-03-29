module WelcomeHelper
  def next_month
    "&dates=" +
    (Date.today + 1.month).beginning_of_month.strftime("%Y%m%d") +
    "%2F" +
    (Date.today + 1.month).end_of_month.strftime("%Y%m%d")
  end
end
