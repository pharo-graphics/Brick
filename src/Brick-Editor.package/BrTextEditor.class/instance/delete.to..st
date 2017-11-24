text - modifications
delete: aFromTextIndex to: aToTextIndex
	| aCommand |

	self
		assert: [ aFromTextIndex > 0 and: [ aFromTextIndex <= self text size ] ]
		description: [ 'From deletion index must be within interval [1... text size]' ].
	self
		assert: [ aToTextIndex > 0 and: [ aToTextIndex <= self text size ] ]
		description: [ 'To deletion index must be within interval [1... text size]' ].
	self
		assert: [ aToTextIndex >= aFromTextIndex ]
		description: [ 'To index must be greater or equal from index' ].

	aCommand := self newDeleteCommand
		fromIndex: aFromTextIndex;
		toIndex: aToTextIndex.
	self enqueueCommand: aCommand.

	self styleText