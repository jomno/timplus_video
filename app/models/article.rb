class Article < ActiveRecord::Base
    belongs_to :curriculum
    YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

    validates :videolink, presence: true, format: YT_LINK_FORMAT
end
