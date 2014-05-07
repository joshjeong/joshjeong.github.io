# U2.W5: Virus Predictor

# I worked on this challenge [by myself].
#Two different hash syntax being used are hash rocket and a new style similar to JSON

# # EXPLANATION OF require_relative- This selects a file to use and reference to
# require_relative 'state_data'


# class VirusPredictor

#   def initialize(state_of_origin, population_density, population, region, regional_spread)
#     @state = state_of_origin
#     @population = population
#     @population_density = population_density
#     @region = region
#     @next_region = regional_spread
#   end

#   def virus_effects  #HINT: What is the SCOPE of instance variables? Scope is within the class
#     predicted_deaths(@population_density, @population, @state)
#     speed_of_spread(@population_density, @state)
#   end

#   private  #what is this?  what happens if it were cut and pasted above the virus_effects method
#           #private makes it so the method is only accessible within the context of the current object
#           #If it was placed above the virus_effects, VirusPredictor.virus_deaths and VirusPredictor.predicted_deaths 
#           #could not be called outside the object

#   def predicted_deaths(population_density, population, state) #based on population size, it will calc number of deaths
#     if @population_density >= 200
#       number_of_deaths = (@population * 0.4).floor
#     elsif @population_density >= 150
#       number_of_deaths = (@population * 0.3).floor
#     elsif @population_density >= 100
#       number_of_deaths = (@population * 0.2).floor
#     elsif @population_density >= 50
#       number_of_deaths = (@population * 0.1).floor
#     else 
#       number_of_deaths = (@population * 0.05).floor
#     end

#     print "#{@state} will lose #{number_of_deaths} people in this outbreak"

#   end

#   def speed_of_spread(population_density, state) #based on population density, it will set speed in months
#     speed = 0.0

#     if @population_density >= 200
#       speed += 0.5
#     elsif @population_density >= 150
#       speed += 1
#     elsif @population_density >= 100
#       speed += 1.5
#     elsif @population_density >= 50
#       speed += 2
#     else 
#       speed += 2.5
#     end

#     puts " and will spread across the state in #{speed} months.\n\n"

#   end

# end

#=======================================================================
#Refactored code

require_relative 'state_data'

class VirusPredictor

  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

  def virus_effects 
    predicted_deaths_speed(@population_density, @population, @state) #combined predicted death and speed
  end

  private 

  def predicted_deaths_speed(population_density, population, state) # added speed to be included in number of deaths
                                                                    # because they had same population dens thresholds
    speed= 0.0
      if @population_density >= 200
        number_of_deaths = (@population * 0.4).floor
        speed += 0.5
      elsif @population_density >= 150
        number_of_deaths = (@population * 0.3).floor
        speed += 1
      elsif @population_density >= 100
        number_of_deaths = (@population * 0.2).floor
        speed += 1.5
      elsif @population_density >= 50
        number_of_deaths = (@population * 0.1).floor
        speed += 2
      else 
        number_of_deaths = (@population * 0.05).floor
        speed += 2.5
      end
  
      print "#{@state} will lose #{number_of_deaths} people in this outbreak and will spread across the state in #{speed} months.\n\n"
  
    end
  
  end
#==============================================================================================================
# DRIVER CODE
alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
alabama.virus_effects
alabama== "Alabama will lose 482202 people in this outbreak and will spread across the state in 2.0 months."

 # initialize VirusPredictor for each state
 
jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
alaska.virus_effects

#will iterate through all the states in STATE_DATA
STATE_DATA.each_key { |state|
  VirusPredictor.new(state, STATE_DATA[state][:population_density], STATE_DATA[state][:population], STATE_DATA[state][:region], STATE_DATA[state][:regional_spread]).virus_effects
}

#REFLECTION
What parts of your strategy worked? What problems did you face?
Fully understanding each line of the code is really important before trying to simplify.
It took me a while to see how I could refactor the death and speed rate.
What questions did you have while coding? What resources did you find to help you answer them?
I had to review .each_key
What concepts are you having trouble with, or did you just figure something out? If so, what?
none in this section
Did you learn any new skills or tricks?
private
How confident are you with each of the Learning Competencies?
Very good
Which parts of the challenge did you enjoy?
I enjoyed looking at an existing code and trying to find a way to improve it.
Which parts of the challenge did you find tedious?
None
