event management
whenAttachedDo: aBlockClosure
	self isAttachedToWidget
		ifTrue: [ aBlockClosure cull: self widget ]
		ifFalse: [
			| anAttachedListener |
			anAttachedListener := nil.
			anAttachedListener := BlEventHandler
				on: BrViewModelAttached
				do: [
					self removeEventHandler: anAttachedListener.
					aBlockClosure cull: self widget ].
			self addEventHandler: anAttachedListener ]