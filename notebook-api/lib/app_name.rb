# class AppName
#     def initialize(app)
#         @app = app
#     end

#     def call(env)
#         ['200', {'Content-Type' => 'text/html'}, ["Notebook API"]]
#     end
# end

class AppName
    def initialize(app, app_name)
        @app = app
        @app_name = app_name
    end

    def call(env)
        puts ">>>>>>> #{env}"
        if env["ORIGINAL_FULLPATH"] == "/"
            ['200', {'Content-Type' => 'text/html'}, ["Teste!"]]
        status, headers, response = @app.call(env)
        headers.merge!({'X-App-Name' => "#{@app_name}"})
        [status, headers, [response.body]]
    end
end
end