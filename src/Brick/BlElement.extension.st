Extension { #name : #BlElement }

{ #category : #'*Brick' }
BlElement >> look [
	^ self userData at: #brickLook ifAbsent: nil
]

{ #category : #'*Brick' }
BlElement >> look: aLook [
	| aLookInstance |
	
	aLookInstance := aLook asLook.
	self removeEventHandlersSuchThat: [ :each | each isKindOf: BrLook ].
	self addEventHandler: aLookInstance.
	self userData at: #brickLook put: aLookInstance
]

{ #category : #'*Brick' }
BlElement >> lookDo: aBlock [
	self look ifNotNil: aBlock
]

{ #category : #'*Brick' }
BlElement >> viewModel [
	^ self userData at: #brickViewModel ifAbsent: nil
]

{ #category : #'*Brick' }
BlElement >> viewModel: aBrToggleModel [
	self removeEventHandler: self viewModel.
	self userData at: #brickViewModel put: aBrToggleModel.
	self addEventHandler: aBrToggleModel
]

{ #category : #'*Brick' }
BlElement >> viewModelDo: aBlock [
	self userData at: #brickViewModel ifPresent: aBlock
]

{ #category : #'*Brick' }
BlElement >> viewModelDo: aBlock ifAbsent: anAbsentBlock [
	self userData
		at: #brickViewModel
		ifPresent: aBlock
		ifAbsent: anAbsentBlock
]
