module Types
  class ImageType < Types::BaseScalar

    def self.coerce_input(input_value, context)
      input_value
    end

  end
end
