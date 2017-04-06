enumerating
select: aBlock
	^ self class new messages: (messages select: aBlock)