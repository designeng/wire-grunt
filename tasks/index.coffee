wire = require "wire"

module.exports = (grunt) ->

	grunt.task.registerTask "wire-experiment", "description...", () ->
		wire(require('./module')).then((context) ->
				console.log "CTX:", context
			, console.error)