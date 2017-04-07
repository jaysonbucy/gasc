class SwimFormsController < ApplicationController
  def index
    @swim_forms = SwimForm.all
  end
end
