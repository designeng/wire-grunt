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
			done: {$ref: 'done'}
		ready:
			"onReady": {}
		afterReturning:
			# "onReady": "doSomething | resolvePromises"
			"onReady": "resolvePromises"
