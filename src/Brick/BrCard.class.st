Class {
	#name : #BrCard,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable + TBrLayoutAlignable',
	#classTraits : 'TBrLayoutResizable classTrait + TBrLayoutAlignable classTrait',
	#instVars : [
		'descriptionModel',
		'pictureModel',
		'buttonModel',
		'titleModel'
	],
	#category : #'Brick-Card - UI'
}

{ #category : #accessing }
BrCard >> action [
	^ buttonModel action
]

{ #category : #accessing }
BrCard >> action: aValuable [
	buttonModel action: aValuable
]

{ #category : #accessing }
BrCard >> description [
	^ descriptionModel text
]

{ #category : #accessing }
BrCard >> description: aStringOrBrText [
	descriptionModel text: aStringOrBrText
]

{ #category : #initialization }
BrCard >> initialize [
	super initialize.
	
	self viewModel: (buttonModel := BrButtonModel new +
		(titleModel := BrLabelModel new) +
		(pictureModel := BrIconModel new) + 
		(descriptionModel := BrDescriptionModel new) +
		(BrInteractiveModel new
			addStates: {
				BrPressModel new.
				BrHoverModel new.
				BrLayoutAlignmentModel center.
				BrLayoutHorizontalResizerModel fitContent.
				BrLayoutVerticalResizerModel fitContent
			}))
]

{ #category : #accessing }
BrCard >> picture [
	^ pictureModel icon
]

{ #category : #accessing }
BrCard >> picture: anElement [
	pictureModel icon: anElement
]

{ #category : #accessing }
BrCard >> title [
	^ titleModel text
]

{ #category : #accessing }
BrCard >> title: aStringOrBrText [
	titleModel text: aStringOrBrText
]
