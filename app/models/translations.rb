require 'rubygems'
require 'bing_translator'

class Translations
  def initialize local_from = 'de', local_to = 'en'
    @translator  = BingTranslator.new('MKnQJZvv0U4edzMy', 'MKnQJZvv0U4edzMyXua0/xEEHC9ZNZdN6lQVzaWu9I0=')
    @local_from = local_from
    @local_to = local_to
  end

  ##
  # translates a given array
  def translate names

    if names.class == String
      translate_string names
    elsif names.class == Array
      translate_arr names
    end

    (names = concat_names names) unless (names.class == String)
    translations = @translator.translate names, :from => @local_from, :to => @local_to
    #split_translations translations
  end

  def translate_string string
    @translator.translate string, :from => @local_from, :to => @local_to
  #  @translator.translate string, :from => @local_from, :to => @local_to
  end

  def translate_arr arr
    concat_names names arr

  end

  def concat_names names
    names.join ' ||| '
  end

  def split_translations names
    names.split ' ||| '
  end
end