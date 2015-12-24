class User < ActiveRecord::Base
  validates_presence_of :name
  before_save :capitalize_name

  def capitalize_name
    self.name = name.split.map do |name_part|
      name_part.capitalize
    end.join(" ")
  end
end
