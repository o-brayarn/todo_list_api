class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json" #Not compulsory

  before do
    response.headers['Access-Control-Allow-Origin'] = "*"
  end

  #enable CORS prefLight requests
  options "*" do
    response.headers['Access-Control-Allow-Method'] = "GET, POST, PUT, PATCH, DELETE, OPTIONS"
  end

  get "/" do # this is the root route of the application (the homepage) but you can have as many routes as you want
    { hello: "Just a starting code 😃" }.to_json
  end

  get "/categories" do
    Category.all.to_json
  end

  get "/category/:id" do #to  make it dynamic, hence accessible using an id
    Category.find(params[:id]).to_json
  end

  get "/todo_lists" do
    TodoList.all.to_json
  end

  get "/todo_list/:id" do
    TodoList.find(params[:id]).to_json
    # TodoList.find(title: params[:title]).to_json
  end

  post "/todo_list" do
    todo_list = TodoList.create(
      title: params[:title],
      description: params[:description],
      category_id: params[:category_id],
      status: false,
    )
  end

  patch "/todo_list/:id" do
    todo_list = TodoList.find(params[:id])
    todo_list.update(
      title: params[:title],
      description: params[:description],
      category_id: params[:category_id],
      status: params[:status],
    )
    # todo_list.to_json
    {message: "Todo List was updated"}.to_json
  end

  delete "/todo_list/:id" do 
    todo_list = TodoList.find(params[:id])
    todo_list.destroy
    {message: "Todo List was removed('#{todo_list.title}')"}.to_json
  end
end
