require "quartz_mailer"

class DinosaurMailer < Quartz::Mailer
  def initialize
    super()
    from "from@example.com"
  end

  def deliver(user : Int64, name : String, body : String, age : Int32, published : Bool)
    to "to@example.com"
    subject "Example Subject"
    body render("mailers/dinosaur_mailer.slang", "mailer.slang")
    super()
  end
end


