class Controller
	onReady: ->
		return "___onReady " + 123

	doSomething: (res) ->
		content = @read("tpl/test.html")
		console.log res, content

module.exports = Controller