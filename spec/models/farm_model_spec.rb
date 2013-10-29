require 'spec_helper'

describe Farm do

  describe "CSV stuff" do
    it "should be able to return a csv value"
      f = Farm.new
      f.name = "foo"
      f.bushes = 5
      f.workers = 2
      f.longitude = -101
      f.latitude = 37

      csv = Farm.to_csv([f])
      components = csv.split(',')

      arr = [];
      arr.append "name"
      arr.append "bushes"
      arr.append "workers"
      arr.append "longitude"
      arr.append "latitude"
      arr.append "created_at"
      arr.append "updated_at\n"
      arr.append "foo"
      arr.append "5"
      arr.append "2"
      arr.append "-101.0"
      arr.append "37.0"
      arr.append "notes"
      arr.append "id"
      arr.append "\n"
      arr.append ""
      arr.append ""
      components.should =~ (arr)
  end
end