require "spec_helper"

describe SettingStore do
  it "has a version number" do
    expect(SettingStore::VERSION).not_to be nil
  end

  describe "#set" do
    it "sets a value to store" do
      expect(SettingStore.set(:example, value: true)).to eq(true)
    end

    context "with group" do
      it "sets a value within a group" do
        expect(SettingStore.set(:example, group: :user_group, value: 'hello')).to eq('hello')
      end
    end
  end

  describe "#get" do
    it "gets a settings from the store" do
      SettingStore.set(:get_example, value: "hello")
      expect(SettingStore.get(:get_example)).to eq("hello")
    end

    it "gets nil for non-existent field" do
      expect(SettingStore.get(:no_example)).to eq(nil)
    end

    context "with group" do
      it "gets a settings from the store" do
        SettingStore.set(:get_example, group: :user_group, value: "hello")
        expect(SettingStore.get(:get_example, group: :user_group)).to eq("hello")
      end

      it "gets nil for non-existent field" do
        expect(SettingStore.get(:no_example, group: :user_group)).to eq(nil)
      end
    end
  end

  describe "#active?" do
    it "gets a truthy value from the store" do
      SettingStore.set(:active_feature, value: true)
      expect(SettingStore.active?(:active_feature)).to eq(true)
    end

    it "gets a falsey value whenever flag is false" do
      SettingStore.set(:inactive_feature, value: false)
      expect(SettingStore.active?(:inactive_feature)).to eq(false)
    end

    it "gets a falsey value whenever a string is returned from flag" do
      SettingStore.set(:other_feature, value: "pen-pineapple")
      expect(SettingStore.active?(:other_feature)).to eq(false)
    end
  end
end
