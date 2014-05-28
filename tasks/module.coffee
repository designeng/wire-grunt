fs = require "fs"
grunt = require "grunt"

module.exports =
	$plugins:[
		'wire/aop'
	]

	message: "test"

	oneComponent:
		create: require "./oneComponent"
		properties:
			test: fs
			read: grunt.file.read
		ready:
			"onReady": {}
		afterReturning:
			"onReady": "doSomething"
