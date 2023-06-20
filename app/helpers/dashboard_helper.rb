module DashboardHelper
    def resource_image(resource)
        if resource.image.attached?
            resource.image
        else
            if resource.is_a?(Community)
                'community_default.png'
            elsif resource.is_a?(User)
                'community_default.png'
            elsif resource.is_a?(Post)
                'community_default.png'
            end
        end
    end
end
