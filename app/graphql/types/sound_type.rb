module Types
  class SoundType < Types::BaseScalar

    def self.coerce_input(input_value, context)
      # if !input_value["title"].is_a?(String) || !input_value["src"].is_a?(String)
      #   return ActiveRecord::RecordInvalid
      # end

      input_value
    end

  end
end
