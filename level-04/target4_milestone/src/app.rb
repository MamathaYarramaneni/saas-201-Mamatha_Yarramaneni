
require 'sinatra'

def get_todos
  @@todos ||= []
end

def add_todo(todo,date)
    if(date!="")
    date="Deadline: "+date
    end
    get_todos().push(:todo=>todo,:date=>date)
end

def get_todo
  get_todos()[@id.to_i - 1]
end

def update_todo(title)
  @abcd=get_todos()[@id.to_i - 1]
  @xyz=@abcd[:date]
  get_todos().delete_at(@id.to_i - 1)
  get_todos().insert((@id.to_i - 1), {:todo=>title,:date=>@xyz})
end

def delete_todo
  get_todos().slice!(@id.to_i - 1)
end

get "/todos" do
  @todos = get_todos()
  erb :todos
end

post "/todos" do
    add_todo(params[:title],params[:date])
  redirect "/todos"
end 
get "/todos/:id" do
  @id = params[:id]
  @abcd = get_todo()
  @todo=@abcd[:todo]
  @date=@abcd[:date]
  erb :todo
end
put "/todos/:id" do
  @id = params[:id]
  update_todo(params[:title])
  redirect "/todos"
end

delete "/todos/:id" do
  @id = params[:id]
  delete_todo()
  redirect "/todos"
end