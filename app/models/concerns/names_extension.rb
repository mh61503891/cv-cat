module NamesExtension

  def build_blanks
    locale_keys = Locale.pluck(:value) - pluck(:locale)
    build(locale_keys.map { |locale_key| { locale: locale_key } })
  end

  def mark_blanks_for_destruction
    select { |name| name.value.blank? }.each do |name|
      name.mark_for_destruction
    end
  end

end
