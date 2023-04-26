require 'recipe_repository'

def reset_recipes_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes' })
  connection.exec(seed_sql)
end

RSpec.describe RecipeRepository do
  before(:each) do 
    reset_recipes_table
  end

  it '#all returns all recipes' do
    repo = RecipeRepository.new
    recipes = repo.all
    expect(recipes.lengt).to eq 3
    expect(recipes[0].id).to eq '1'
    expect(recipes[0].name).to eq 'Soup'
    expect(recipes[0].average_cooking_time).to eq '40'
    expect(recipes[0].ratin).to eq '3'
    expect(recipes[1].id).to eq '2'
    expect(recipes[1].name).to eq 'Curry'
    expect(recipes[1].average_cooking_time).to eq '60'
    expect(recipes[1].ratin).to eq '5'
    expect(recipes[2].id).to eq '3'
    expect(recipes[2].name).to eq 'Crumble'
    expect(recipes[2].average_cooking_time).to eq '30'
    expect(recipes[2].rating).to eq 4'
  end
end