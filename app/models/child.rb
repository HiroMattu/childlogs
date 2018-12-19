class Child < ApplicationRecord
  belongs_to :user
  
    validates :childname, presence: true, length: { maximum: 50 }
    validates :childbirthday, presence: true, length: { maximum: 10 }

  has_many :childlogs
  
  def age
   date_format = "%Y%m%d"
   (Date.today.strftime(date_format).to_i - childbirthday.strftime(date_format).to_i) / 10000
  end
  
end