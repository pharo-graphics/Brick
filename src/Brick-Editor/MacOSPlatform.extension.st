Extension { #name : #MacOSPlatform }

{ #category : #'*Brick-Editor' }
MacOSPlatform >> initializeBrickInteractionsFor: aTextEditor [
	"Add and override any platform specific key bindings.
	Nothing to do by default"

	^aTextEditor initializeMacInteractions
]
