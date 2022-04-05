module Types
  class ImageType < Types::BaseScalar

    def self.coerce_input(input_value, context)
      # if !input_value["author"].is_a?(String) || !input_value["download_url"].is_a?(String)
      #   return ActiveRecord::RecordInvalid
      # end

      input_value
    end

  end
end
