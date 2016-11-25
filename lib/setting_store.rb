require "setting_store/version"
require 'pstore'

module SettingStore
  def self.set(field, value: nil)
    store.transaction { store[field.to_sym] = value }
  end

  def self.get(field)
    store.transaction { store[field.to_sym] }
  end

  def self.active?(field)
    get(field.to_sym) == true
  end

  private

  def self.store
    @store ||= PStore.new(store_filename)
  end

  def self.store_filename
    if ENV['STORE_FILENAME']
      ENV['STORE_FILENAME']
    else
      "local_settings_store.pstore"
    end
  end
end
