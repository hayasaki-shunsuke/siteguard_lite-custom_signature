class BytesizeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value && value.bytesize > options[:maximum]
      record.errors.add(attribute, :too_long, count: options[:maximum])
    end
  end
end
