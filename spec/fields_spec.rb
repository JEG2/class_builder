require_relative "spec_helper"

require_relative "../lib/class_builder"

describe ClassBuilder do
  context "fields" do
    it "can add public readers" do
      cls = ClassBuilder.new do |builder|
        builder.public_readers :a, :b
      end
      expect(cls.public_instance_methods(false)).to include(:a)
      expect(cls.public_instance_methods(false)).to include(:b)
    end

    it "can add protected readers" do
      cls = ClassBuilder.new do |builder|
        builder.protected_readers :a, :b
      end
      expect(cls.protected_instance_methods(false)).to include(:a)
      expect(cls.protected_instance_methods(false)).to include(:b)
    end

    it "can add private readers" do
      cls = ClassBuilder.new do |builder|
        builder.private_readers :a, :b
      end
      expect(cls.private_instance_methods(false)).to include(:a)
      expect(cls.private_instance_methods(false)).to include(:b)
    end

    it "can add public writers" do
      cls = ClassBuilder.new do |builder|
        builder.public_writers :a, :b
      end
      expect(cls.public_instance_methods(false)).to include(:a=)
      expect(cls.public_instance_methods(false)).to include(:b=)
    end

    it "can add protected writers" do
      cls = ClassBuilder.new do |builder|
        builder.protected_writers :a, :b
      end
      expect(cls.protected_instance_methods(false)).to include(:a=)
      expect(cls.protected_instance_methods(false)).to include(:b=)
    end

    it "can add private writers" do
      cls = ClassBuilder.new do |builder|
        builder.private_writers :a, :b
      end
      expect(cls.private_instance_methods(false)).to include(:a=)
      expect(cls.private_instance_methods(false)).to include(:b=)
    end
  end
end
