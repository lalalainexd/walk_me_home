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
end
