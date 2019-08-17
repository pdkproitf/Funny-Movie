module SharesHelper
  def youtube_video(youtube_url, css_class = 'embed-responsive-item')
    youtube_params = youtube_url.split("?").second
    youtube_id = youtube_params.split("&").first.split('=').last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}", class: css_class)
  end
end
