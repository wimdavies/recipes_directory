require_relative './recipe'

class RecipeRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, average_cooking_time, rating FROM recipes;
    sql = 'SELECT id, name, average_cooking_time, rating FROM recipes;'
    records = DatabaseConnection.exec_params(sql, [])

    # Returns an array of Recipe objects.
    recipes = []

    records.each do |record|
      recipe = Recipe.new
      recipe.id = record['id']
      recipe.name = record['name']
      recipe.average_cooking_time = record['average_cooking_time']
      recipe.rating = record['rating']

      recipes << recipe
    end

    recipes
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, average_cooking_time, rating FROM recipes WHERE id = $1;
    sql = 'SELECT id, name, average_cooking_time, rating FROM recipes WHERE id = $1;'
    params = [id]
    result = DatabaseConnection.exec_params(sql, params)
    
    # Returns a single Recipe object.
    record = result[0]
    recipe = Recipe.new
  
    recipe.id = record['id']
    recipe.name = record['name']
    recipe.average_cooking_time = record['average_cooking_time']
    recipe.rating = record['rating']

    recipe
  end
end