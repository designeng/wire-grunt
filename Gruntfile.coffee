connectMW = require(require("path").resolve("middleware", "connectMW.coffee"))

module.exports = (grunt) ->

    port = 7788
  
    # Project configuration.
    grunt.initConfig

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
                            connectMW.stubService
                            connectMW.autocompleteService
                            connectMW.folderMount(connect, options.base)
                        ]

        concat:
            main:
                src: ["app/js/requireConfig.js", "app/js/main.js"]
                dest: "app/js/main.js"

        clean:
            public: "public"

        requirejs:
            compile:
                options:
                    appDir: "app"
                    baseUrl: "js"
                    mainConfigFile: "app/js/requireConfig.js"
                    dir: "public"

                    optimize: "none"
                    removeCombined: true

                    paths:
                        "wire/builder/rjs": "../../builder/builder"

                    modules: [
                        name: "main"
                        include: [
                            "main"
                            "components/autocomplete/spec"
                        ]
                    ]

    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-connect"
    grunt.loadNpmTasks "grunt-contrib-concat"
    grunt.loadNpmTasks "grunt-newer"

    grunt.registerTask "default", ["connect:server", "watch"]

    # compilation
    grunt.registerTask "coffee-compile-app", ["newer:coffee:app"]

    # server
    grunt.registerTask "server", ["connect"]

    # build
    grunt.loadNpmTasks "grunt-contrib-requirejs"
    grunt.loadNpmTasks "grunt-contrib-clean"

    grunt.registerTask "build", ["requirejs:compile"]
    
    # wire-based tasks integration
    grunt.task.loadTasks "tasks"
    grunt.registerTask "we", ["wire-experiment"]

