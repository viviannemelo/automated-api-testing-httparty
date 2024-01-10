describe 'Create' do
    def login(field_email, field_password)
        @body = {
            session: {
                email: field_email,
                password: field_password
            }
        }.to_json

        @login = Login.post('/session', body: @body)
        puts @login.body
    end
    
    context 'tasks' do
        before { login('mail@test.com', '123456') }


        it 'success' do
            @header = {
                'Content-Type': 'application/json',
                Accept: 'application/vnd.tasksmanager.v2',
                Authorization: @login.parsed_response['data']['attributes']['auth-token']
            }

            @body = {
                task: {
                    title: 'First Task',
                    description: 'This is the first task',
                    deadline: '2020-06-08 13:00:00',
                    done: true
                }
            }.to_json

            @tasks = Create.post('/tasks', body: @body, headers: @header)
            puts @tasks
            expect(@tarefas.parsed_response['data']['attributes']['title']).to eq 'First Task'
        end
    end
end