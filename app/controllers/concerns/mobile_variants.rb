module MobileVariants
  extend ActiveSupport::Concern

  included do
    before_action :determine_mobile_variant
    helper_method :mobile_request?
  end

  module ClassMethods
    def skip_mobile_variant(*args)
      skip_before_action :determine_mobile_variant, *args
    end
  end

  private def determine_mobile_variant
    request.variant = :mobile if browser.device.mobile?
  end

  private def mobile_request?
    Array(request.variant).include? :mobile
  end
end