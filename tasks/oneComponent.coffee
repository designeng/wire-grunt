class Controller
	onReady: ->
		return "___onReady " + 123

	doSomething: (res) ->
		console.log res

module.exports = Controller