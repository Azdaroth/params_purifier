require 'spec_helper'

describe ParamsPurifier::Purification do

  subject { ParamsPurifier::Purification }

  it "does not change params if there are no arrays" do
    params = { 
      "user_id" => "1",
      "comment_attributes" => { 
        "id" => "2",
        "content" => "content" 
      }
    }
    expect(subject.execute(params)).to eq params
  end

  it "removes empty strings from arrays - level 0 of nesting" do
    params = { "user_ids" => ["", "1"], "name" => "name" }
    result = { "user_ids" => ["1"], "name" => "name" }
    expect(subject.execute(params)).to eq result
  end

  it "removes empty strings from arrays - level 1 of nesting" do
    params = { "comment_attributes" => {
        "post_ids" => [""],
        "content" => "content"
      } 
    }
    result = { "comment_attributes" => {
        "post_ids" => [],
        "content" => "content"
      } 
    }
    expect(subject.execute(params)).to eq result
  end

  it "removes empty strings from arrays - level 2 of nesting" do
    params = { "comment_attributes" => {
        "some_ids" => [""],
        "other_attributes" => {
          "values" => ["", "value"]
        },
        "content" => "content"
      } 
    }
    result = { "comment_attributes" => {
        "some_ids" => [],
        "other_attributes" => {
          "values" => ["value"]
        },
        "content" => "content"
      } 
    }
    expect(subject.execute(params)).to eq result
  end

end