cache - computation
forwardText
	"Return a forward text that start from the next item after the last cached one"
	<return: #BlText>
	| textStart textEnd |

	text isEmpty
		ifTrue: [ ^ BlSubText empty: text ].

	textStart := self end + 1.
	textEnd := text size.

	^ text from: textStart to: textEnd