module ApplicationHelper
    include Pagy::Frontend
    # <%= user_gravatar @user %> for show
    def user_gravatar(user)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}"
        image_tag(gravatar_url)
    end

    def company_name
        "persuasion paper"
    end
end
