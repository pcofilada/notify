class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :category, :logo, :subscribers_count

  def logo
    "#{Rails.application.secrets.host_name}#{object.logo.url()}"
  end

  def subscribers_count
    "#{object.subscriptions.count}"
  end
end
