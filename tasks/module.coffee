fs = require "fs"

module.exports =
	$plugins:[
		'wire/aop'
	]

	message: "test"

	oneComponent:
		create: require "./oneComponent"
		properties:
			test: fs
		ready:
			"onReady": {}
		afterReturning:
			"onReady": "doSomething"
