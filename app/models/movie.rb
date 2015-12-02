class Movie < ActiveRecord::Base
    validates(:title, presence: true, length: { maximum: 50 })
    validates(:description, presence: true, length: { maximum: 300, minimum: 15 })
    validates(:category, presence:true, length: { maximum: 14 })
    mount_uploader(:picture, PictureUploader)
    validate(:picture_size)
    
    has_many :favorites, dependent: :destroy
    has_many :critics, through: :favorites
    
    def self.search(search)
        if search
            Movie.where(['title LIKE ?', "%#{search}%"])
        else
            Movie.all
        end
    end

    private
        
        def picture_size 
            if picture.size > 10.megabytes
                errors.add(:picture, "shouldbe less than 10MB")
            end
        end

end
