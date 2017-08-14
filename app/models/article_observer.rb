class ArticleObserver < ActiveRecord::Observer
  def before_save(resource)
    if resource.videolink==""
      puts "false"
    else
      puts "success"
      video = Yt::Video.new url: resource.videolink
      resource.uid = video.id
      resource.ytb = true
    end
  end
end