class Arihant < ActiveRecord::Base
      belongs_to :user
validates :Name,presence:true,length: {minimum: 3, maximum: 50}
validates :Division,presence:true,length: {minimum: 1, maximum: 50}
validates :user_id, presence:true
end
