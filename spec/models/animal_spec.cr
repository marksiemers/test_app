require "./spec_helper"
require "../../src/models/animal.cr"

describe Animal do
  Spec.before_each do
    Animal.clear
  end
end
