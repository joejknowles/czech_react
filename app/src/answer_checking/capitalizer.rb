module Capitalizer
  def self.capitalize string
    string.unicode_normalize(:nfd).capitalize.unicode_normalize(:nfc)
  end
end