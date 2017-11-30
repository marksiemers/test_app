class AnimalController < ApplicationController
  def index
    animals = Animal.all
    render("index.slang")
  end

  def show
    if animal = Animal.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Animal with ID #{params["id"]} Not Found"
      redirect_to "/animals"
    end
  end

  def new
    animal = Animal.new
    render("new.slang")
  end

  def create
    animal = Animal.new(animal_params.validate!)

    if animal.valid? && animal.save
      flash["success"] = "Created Animal successfully."
      redirect_to "/animals"
    else
      flash["danger"] = "Could not create Animal!"
      render("new.slang")
    end
  end

  def edit
    if animal = Animal.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Animal with ID #{params["id"]} Not Found"
      redirect_to "/animals"
    end
  end

  def update
    if animal = Animal.find(params["id"])
      animal.set_attributes(animal_params.validate!)
      if animal.valid? && animal.save
        flash["success"] = "Updated Animal successfully."
        redirect_to "/animals"
      else
        flash["danger"] = "Could not update Animal!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Animal with ID #{params["id"]} Not Found"
      redirect_to "/animals"
    end
  end

  def destroy
    if animal = Animal.find params["id"]
      animal.destroy
    else
      flash["warning"] = "Animal with ID #{params["id"]} Not Found"
    end
    redirect_to "/animals"
  end

  def animal_params
    params.validation do
      required(:name) { |f| !f.nil? }
      required(:body) { |f| !f.nil? }
      required(:published) { |f| !f.nil? }
    end
  end
end
