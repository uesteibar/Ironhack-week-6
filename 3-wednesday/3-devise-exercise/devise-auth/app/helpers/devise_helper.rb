module DeviseHelper
  def devise_error_messages!
    puts resource.errors.messages

    messages = resource.errors.messages.map do |key, message|
       "#{key} #{message.join(" and ")}"
    end
    flash[:danger] = "#{messages.join(", ").capitalize}." if messages.any?
    return nil
  end
end
