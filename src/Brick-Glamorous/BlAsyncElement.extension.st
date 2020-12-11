Extension { #name : #BlAsyncElement }

{ #category : #'*Brick-Glamorous' }
BlAsyncElement >> withGlamorousPreview [
	"Set default delayed glamorous preview.
	It should be set before added to a scene."
	self withDelayedPreview: BrGlamorousAsyncElementProgressPreviewStencil new
]

{ #category : #'*Brick-Glamorous' }
BlAsyncElement >> withGlamorousPreview: aLabel [
	"Set default delayed glamorous preview with a custom label.
	It should be set before added to a scene."
	self withDelayedPreview: (BrGlamorousAsyncElementProgressPreviewStencil new label: aLabel)
]
