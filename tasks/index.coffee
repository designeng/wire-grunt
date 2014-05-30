wire = require "wire"
spec = require('./module')

module.exports = (grunt) ->

	noop = () ->

	grunt.task.registerTask "wire-experiment", "description...", () ->

		done = @async()
		spec.done = done

		wire(spec).then((context) ->
				noop()
			, console.error)