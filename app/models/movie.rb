class Movie < ActiveRecord::Base
    mount_uploader :picture, PictureUploader
    validates(:title, presence: true, length: { maximum: 50 })
    validates(:description, presence: true, length: { maximum: 300, minimum: 15 })
    validates(:category, presence:true, length: { maximum: 14 })
    validate(:picture_size)

    private
    
        def picture_size 
            if picture.size > 10.megabytes
                errors.add(:picture, "shouldbe less than 10MB")
            end
        end
end
