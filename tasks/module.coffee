fs = require "fs"

module.exports =
	message: "test"

	oneComponent:
		create: require "./oneComponent"
		properties:
			test: fs
		ready:
			"onReady": {}
