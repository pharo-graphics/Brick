events
wantsEvent: anEvent

	^ (anEvent isKindOf: BlMouseEvent)
		and: [anEvent currentTarget isAttachedToSceneGraph
			and: [ anEvent currentTarget text isNotEmpty ] ]