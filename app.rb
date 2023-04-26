require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')

recipe_repository = RecipeRepository.new

# Write code in the main file app.rb 
# so it prints out the list of recipes.

recipe_repository.all.each do |recipe|
  p recipe
end