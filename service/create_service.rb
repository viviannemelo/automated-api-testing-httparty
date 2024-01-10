module Create
    include HTTParty
    base_uri 'http://api-de-tarefas.herokuapp.com'
    format :json
end