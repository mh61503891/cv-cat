class PublisherDecorator < Draper::Decorator

  delegate_all

  def names_tag
    object.names.map(&:value).compact_blank.join(" / ")
  end

  def abbreviations_tag
    object.abbreviations.map(&:value).compact_blank.join(" / ")
  end

  def link_to_url_tag
    if object.url.present?
      helpers.link_to object.url, object.url
    else
      ""
    end
  end

end
