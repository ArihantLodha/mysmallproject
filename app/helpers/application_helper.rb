module ApplicationHelper
def gravatar_for(user, options={size: 80})
  
# create the md5 hash
gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
size = options[:size]
# compile URL which can be used in <img src="RIGHT_HERE"...
gravatar_url = "https://www.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
image_tag(gravatar_url, alt: user.username, class: "img-circle")

end
end
