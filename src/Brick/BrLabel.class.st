Class {
	#name : #BrLabel,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable + TBrLayoutAlignable + TBrSizeAdjustable',
	#classTraits : 'TBrLayoutResizable classTrait + TBrLayoutAlignable classTrait + TBrSizeAdjustable classTrait',
	#category : #'Brick-Label - UI'
}

{ #category : #layout }
BrLabel >> baselineOffset [
	^ self
		childWithId: #label
		ifFound: [ :aTextElement | aTextElement baselineOffset + self padding top + aTextElement margin top ]
		ifNone: [ 0 ]
]

{ #category : #printing }
BrLabel >> gtDisplayString [ 

	^self text asString
]

{ #category : #initialization }
BrLabel >> initialize [
	super initialize.
	
	self
		fitContent;
		beNormalSize.

	self viewModel: (BrLabelModel new add: (BrInteractiveModel withAll: {
		BrLayoutAlignmentModel new centerLeft.
	}))
]

{ #category : #accessing }
BrLabel >> text [
	<return: #BlText>

	^ self viewModel text
]

{ #category : #accessing }
BrLabel >> text: aTextOrString [
	self viewModel text: aTextOrString
]
