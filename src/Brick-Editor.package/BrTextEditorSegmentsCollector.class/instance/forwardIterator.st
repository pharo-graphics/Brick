cache - computation
forwardIterator
	"Return a forward text iterator that start from the next item after the last cached one"
	<return: #BrTextIterator>
	| iteratorStart iteratorEnd |

	iteratorStart := self end + 1.
	iteratorEnd := text size.

	^ text iterator: iteratorStart to: iteratorEnd