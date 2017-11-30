require "./spec_helper"

def animal_hash
  {"name" => "Fake", "body" => "Fake", "published" => "true"}
end

def animal_params
  params = [] of String
  params << "name=#{animal_hash["name"]}"
  params << "body=#{animal_hash["body"]}"
  params << "published=#{animal_hash["published"]}"
  params.join("&")
end

def create_animal
  model = Animal.new(animal_hash)
  model.save
  model
end

class AnimalControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Logger.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe AnimalControllerTest do
  subject = AnimalControllerTest.new

  it "renders animal index template" do
    Animal.clear
    response = subject.get "/animals"

    response.status_code.should eq(200)
    response.body.should contain("Animals")
  end

  it "renders animal show template" do
    Animal.clear
    model = create_animal
    location = "/animals/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Animal")
  end

  it "renders animal new template" do
    Animal.clear
    location = "/animals/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Animal")
  end

  it "renders animal edit template" do
    Animal.clear
    model = create_animal
    location = "/animals/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Animal")
  end

  it "creates a animal" do
    Animal.clear
    response = subject.post "/animals", body: animal_params

    response.headers["Location"].should eq "/animals"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a animal" do
    Animal.clear
    model = create_animal
    response = subject.patch "/animals/#{model.id}", body: animal_params

    response.headers["Location"].should eq "/animals"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a animal" do
    Animal.clear
    model = create_animal
    response = subject.delete "/animals/#{model.id}"

    response.headers["Location"].should eq "/animals"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
