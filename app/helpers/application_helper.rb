module ApplicationHelper
  include Wobapphelpers::Helpers::All

    def configuration_active_class
      if Ack4nagios::CONFIGURATION_CONTROLLER.include?(controller.controller_name.to_sym)
        "active"
      end
    end

    def tts_active_class
      if Ack4nagios::TTS_CONTROLLER.include?(controller.controller_name.to_sym)
        "active"
      end
    end

    def acks_active_class
      if controller.controller_name.to_sym == :acknowledges
        "active"
      end
    end

end
