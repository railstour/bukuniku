module ApplicationHelper
  def active_class(path)
    'active' if request.fullpath == path
  end

  def money_amount(amount)
    number_to_currency(amount, unit: 'Rp.')
  end

  def short_summary(words, length, link)
    summary = words.truncate(length, separator: ' ')
    "#{summary} #{link_to('see more', link)}".html_safe
  end
end
