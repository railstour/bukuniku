module ApplicationHelper
  def active_class(path)
    'active' if request.fullpath == path
  end
end
