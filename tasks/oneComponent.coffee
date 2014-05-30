When = require "when"

class Controller
	onReady: ->
		return "___onReady " + 123

	doSomething: (res) ->
		content = @read("tpl/test.html")
		console.log res, content

	later: (val) ->
		return When(val).delay(Math.random()*10)

	plus: (sum, value)->
		return sum + value

	resolvePromises: ->

		array = ["a", @later("b")]

		console.log "resolvePromises"
		
		When.reduce(array, @plus).then (res) =>
			console.log "RES:::", res
			@done()


module.exports = Controller