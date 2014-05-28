connectMW = require(require("path").resolve("middleware", "connectMW.coffee"))

module.exports = (grunt) ->
  
    # Project configuration.
    grunt.initConfig

        port = 7788

        watch:
            coffee_app:
                files: ['app/coffee/**/**.coffee']
                tasks: ["coffee-compile-app"]
            js_requireConfig:
                files: ["app/js/requireConfig.js", "app/js/main.js"]
                tasks: ["concat:main", "concat:jasmine"]
            js:
                files: ["app/js/**/**.js"]
                options:
                    livereload: true

        coffee:
            app:
                options: {
                    bare: true
                }
                files: [
                    expand: true
                    cwd: 'app/coffee'
                    src: ['**/*.coffee']
                    dest: 'app/js'
                    ext: '.js'
                ]

        connect:
            server:
                options:
                    port: port
                    base: '.'
                    middleware: (connect, options) ->
                        return [
                            connectMW.folderMount(connect, options.base)
                        ]

        concat:
            main:
                src: ["app/js/requireConfig.js", "app/js/main.js"]
                dest: "app/js/main.js"
        
    grunt.task.loadTasks "tasks"
    grunt.registerTask "we", ["wire-experiment"]

