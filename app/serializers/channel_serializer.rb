class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :status, :category, :logo, :subscribers_count, :owner_id

  def logo
    "#{Rails.application.secrets.host_name}#{object.logo.url(:medium)}"
  end

  def subscribers_count
    "#{object.subscriptions.count}"
  end
end
