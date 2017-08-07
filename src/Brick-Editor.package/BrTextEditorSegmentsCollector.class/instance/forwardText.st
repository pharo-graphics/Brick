cache - computation
forwardText
	"Return a forward text that start from the next item after the last cached one"
	<return: #BrText>
	| textStart textEnd |

	textStart := self end + 1.
	textEnd := text size.

	^ text from: textStart to: textEnd