text - cursor
moveCursorTo: aTextIndex
	"Moves cursor to a given position without any further action such as cancelling selection"
	<event: #BrTextEditorCursorMovedEvent>
	| aCommand |

	self
		assert: [ aTextIndex between: 0 and: self text size ]
		description: [ 'Text cursor must not exceed text bounds' ].

	aCommand := self newCursorMoveCommand
		position: aTextIndex.
	self enqueueCommand: aCommand