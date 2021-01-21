module EnumerationHelper
    def get_translated_keys(values, enumKeyTranslator, enumName)
      returned_array = values.map { |v| I18n.t("enumerations.#{enumKeyTranslator}.#{v}") }
      returned_array.to_s.remove("[", "]", /"/)
    end
    # get_translated_keys(Feelings.list, "feelings", Feelings)
  end
  