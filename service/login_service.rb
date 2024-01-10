module Login
    include HTTParty
    base_uri 'http://api-de-tarefas.herokuapp.com'
    format :json
    headers 'Accept' => 'application/vnd.tasksmanager.v2',
            'Content-Type' => 'application/json'
  end