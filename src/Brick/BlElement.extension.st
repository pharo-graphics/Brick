Extension { #name : #BlElement }

{ #category : #'*Brick' }
BlElement >> actors [
	^ Array streamContents: [ :aStream |
		self viewModelDo: [ :aViewModel | aStream nextPut: aViewModel ].	
		self lookDo: [ :aLook | aStream nextPut: aLook ] ]
]

{ #category : #'*Brick' }
BlElement >> addInteractiveModelState: aState [
	self viewModel
		ifNil: [ self viewModel: (BrInteractiveModel with: aState) ]
		ifNotNil: [ self viewModel addInteractiveModelState: aState ].
]

{ #category : #'*Brick' }
BlElement >> addLook: aLook [
	self look
		ifNil: [ self look: aLook ]
		ifNotNil: [ self look add: aLook ].
]

{ #category : #'*Brick' }
BlElement >> addViewModel: aViewModel [
	self viewModel
		ifNil: [ self viewModel: aViewModel ]
		ifNotNil: [ self viewModel add: aViewModel ].
]

{ #category : #'*Brick' }
BlElement >> anchor [
	^ self userData at: #brickAnchor ifAbsent: [ self parent ifNotNil: #anchor ]
]

{ #category : #'*Brick' }
BlElement >> anchor: anElement [
	self userData at: #brickAnchor put: anElement
]

{ #category : #'*Brick' }
BlElement >> asBrAnchoredAnchorBounds [
	^ BrAnchoredElementAnchorBounds element: self
]

{ #category : #'*Brick' }
BlElement >> asStencil [
	^ self
]

{ #category : #'*Brick' }
BlElement >> asVerticallyResizableDo: aBlock [
	^ aBlock value: (BlElement new
		look: BrGlamorousWithVerticalResizerLook;
		addChild: self)
]

{ #category : #'*Brick' }
BlElement >> gtInspectorModelLookGraphIn: aComposite [
	<gtInspectorPresentationOrder: 30>
	
	^ aComposite blocMondrian
		title: 'Widget';
		painting: [ :view | self gtInspectorPaintModelLookIn: view ] 
]

{ #category : #'*Brick' }
BlElement >> gtInspectorPaintModelLookIn: aMondrianView [
	| nodes |

	nodes := { self }.
	self viewModelDo: [ :aViewModel | nodes := nodes, aViewModel withAllChildren ].
	self lookDo: [ :aLook | nodes := nodes, aLook withAllChildren ].
	nodes := nodes asSet asArray.
	
	aMondrianView nodes
		shape: [ :each |
			BlElement new
				geometry: BlEllipseGeometry new;
				size: 20@20;
				layout: BlLinearLayout horizontal alignCenter;
				border: (BlBorder paint: Color lightGray width: 1);
				addChild: (BlTextElement new
					clipChildren: false;
					preventMouseEvents;
					text: (((each isKindOf: BlElement)
						ifTrue: [ 'W' asRopedText ]
						ifFalse: [ (each isKindOf: BrLook)
							ifTrue: [ 'L' asRopedText ]
							ifFalse: [ 'M' asRopedText ] ]) fontSize: 7)) ];
		with: nodes.
	
	aMondrianView edges 
		fromCenterBottom;
		toCenterTop;
		connectToAll: #actors.
	
	aMondrianView layout tree
]

{ #category : #'*Brick' }
BlElement >> look [
	^ self userData at: #brickLook ifAbsent: nil
]

{ #category : #'*Brick' }
BlElement >> look: aLook [
	| aLookInstance |
	
	self lookDo: [ :aCurrentLook |
		aCurrentLook onUninstalledIn: self.
		self userData at: #brickLook put: nil ].

	aLookInstance := aLook asLook.

	self userData at: #brickLook put: aLookInstance.
	aLookInstance onInstalledIn: self
]

{ #category : #'*Brick' }
BlElement >> lookDo: aBlock [
	self look ifNotNil: aBlock
]

{ #category : #'*Brick' }
BlElement >> removeLook: aLook [
	self look
		ifNotNil: [
			self look = aLook
				ifTrue: [  ]
				ifFalse: [ self look remove: aLook ] ].
]

{ #category : #'*Brick' }
BlElement >> viewModel [
	^ self userData at: #brickViewModel ifAbsent: nil
]

{ #category : #'*Brick' }
BlElement >> viewModel: aBrViewModel [
	self lookDo: [ :aLook | self error: 'View model must be added before look' ].

	self viewModelDo: [ :aCurrentModel |
		aCurrentModel onUninstalledIn: self.
		self userData at: #brickViewModel put: nil ].

	self userData at: #brickViewModel put: aBrViewModel.
	aBrViewModel onInstalledIn: self
]

{ #category : #'*Brick' }
BlElement >> viewModelDo: aBlock [
	self userData at: #brickViewModel ifPresent: aBlock
]

{ #category : #'*Brick' }
BlElement >> viewModelDo: aBlock ifAbsent: anAbsentBlock [
	^ self userData
		at: #brickViewModel
		ifPresent: aBlock
		ifAbsent: anAbsentBlock
]
