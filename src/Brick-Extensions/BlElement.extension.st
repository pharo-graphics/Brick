Extension { #name : #BlElement }

{ #category : #'*Brick-Extensions' }
BlElement >> gtInspectorModelLookGraphIn: aComposite [
	<gtInspectorPresentationOrder: 30>
	
	^ aComposite blocMondrian
		title: 'Widget';
		painting: [ :view | self gtInspectorPaintModelLookIn: view ] 
]

{ #category : #'*Brick-Extensions' }
BlElement >> gtInspectorPaintModelLookIn: aMondrianView [
	| nodes |

	nodes := { self }.
	self viewModelDo: [ :aViewModel | nodes := nodes, aViewModel withAllChildren ].
	self aptitudeDo: [ :aLook | nodes := nodes, aLook withAllChildren ].
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
						ifFalse: [ (each isKindOf: BrAptitude)
							ifTrue: [ 'L' asRopedText ]
							ifFalse: [ 'M' asRopedText ] ]) fontSize: 7)) ];
		with: nodes.
	
	aMondrianView edges 
		fromCenterBottom;
		toCenterTop;
		connectToAll: #actors.
	
	aMondrianView layout tree
]
