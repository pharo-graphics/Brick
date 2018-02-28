events
wantsEvent: anEvent

	^ (anEvent isKindOf: BlMouseEvent)
		and: [
			self
				assert: [ anEvent currentTarget isAttachedToSceneGraph ]
				description: [ 'Event target must be attached to the scene graph' ].
			
			anEvent currentTarget text isNotEmpty ]