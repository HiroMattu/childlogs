class Childlog < ApplicationRecord
    
    validates :word, presence: true, length: { maximum: 50 }
    validates :content, presence: true, length: { maximum: 255 }
    validates :childwordtiming, presence: true, length: { maximum: 10 }


    belongs_to :user
    belongs_to :child
    
  def childwordage
   date_format = "%Y%m%d"
   (childwordtiming.strftime(date_format).to_i - childlog.child.childbirthday.strftime(date_format).to_i) / 10000
  end
  
end
