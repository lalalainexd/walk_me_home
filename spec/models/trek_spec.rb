require 'spec_helper'

describe Trek do

  describe "start" do

    before do
    end

    context "positive duration" do
      it "set the started_at time" do
        now = Time.now
        Time.stub(:now).and_return(now)

        subject.start 10
        expect(subject.started_at).to eq now
      end

      it "set the expected_end_at time" do
        now = Time.now
        Time.stub(:now).and_return(now)

        subject.start 10
        expect(subject.expected_end_at).to eq now+10
      end
    end

    context "negative duration" do
      it "has expected_end_at errors" do
        subject.start -10
        expect(subject).to have(1).error_on(:expected_end_at)
      end
    end
  end

  describe "pending_end?" do
    context "treks is not over but time is up" do
      it "should be pending end" do
        trek = Trek.new
        trek.expected_end_at = Time.now - 10000
        trek.started_at = Time.now - 2000
        expect(trek).to be_pending_end
      end
    end

    context "trek is in progress" do
      it "should not be pending end" do
        trek = Trek.new
        trek.expected_end_at = Time.now + 10000000
        trek.started_at = Time.now - 2000
        expect(trek).to_not be_pending_end
      end
    end

    context "trek is over" do
      it "should not be pending end" do
        trek = Trek.new
        trek.over = true
        expect(trek).to_not be_pending_end
      end
    end
  end

  describe "stop" do
    it "to be over" do
      trek = Trek.new
      trek.expected_end_at = Time.now
      trek.started_at = Time.now
      trek.stop
      expect(trek).to be_over
    end
  end

  describe "extend" do
    context "valid extended time" do
      it "extends a trip" do
        trek = Trek.new
        trek.start(1000)
        original_end = trek.expected_end_at
        trek.extend_time(2000)
        expect(trek.expected_end_at).to eq (original_end+2000)
      end
    end

    context "invalid extended time" do
      it "doesnt extend a trip" do
        trek = Trek.new
        trek.start(1000)
        original_end = trek.expected_end_at
        trek.extend_time(-2000)
        expect(trek.expected_end_at).to eq (original_end)
      end
    end
  end
end
