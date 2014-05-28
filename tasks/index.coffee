wire = require "wire"

module.exports = (grunt) ->

	noop = () ->

	grunt.task.registerTask "wire-experiment", "description...", () ->
		wire(require('./module')).then((context) ->
				noop()
			, console.error)