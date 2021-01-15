Class {
	#name : #BrSimpleListExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-List'
}

{ #category : #'examples - vertical list' }
BrSimpleListExamples >> allClasses [
	<gtExample>
	^ BrSimpleList new
		itemStencil: [
			BrLabel new
				"hMatchParent;"
				look: BrGlamorousLabelLook new + (BrStyleCommonLook new
					selected: [ :aStyle | aStyle background: Color veryVeryLightGray ]);
				padding: (BlInsets all: 5) ];
		itemDataBinder: [ :eachElement :eachClass :eachIndex | eachElement text: eachClass name ];
		items: (SystemNavigation new allClasses sorted: [ :a :b | a name < b name ])
]

{ #category : #'examples - horizontal list' }
BrSimpleListExamples >> horizontalAllClasses [
	<gtExample>
	| aList aResult |
	aList := self allClasses.
	aList beHorizontal.
	
	^ aList
]

{ #category : #'examples - nested lists' }
BrSimpleListExamples >> horizontalAndVerticalNumbers [
	<gtExample>
	| aList |
	aList := self 
		horizontalListFor: (0 to: 10000 by: 100)
		verticalListFor: [ :aNumber | aNumber to: aNumber + 99 ].
	^ aList
]

{ #category : #'examples - support' }
BrSimpleListExamples >> horizontalListFor: aCollection [
	<gtExample>
	| aList aScrollable |
	aList := BrSimpleList horizontal
		itemType: [ :aFactory :anItem :anIndex | 
			Integer ];
		itemStencil: [ :anItemType | 
			self label ];
		itemDataBinder: [ :anElement :anItem :anIndex | 
			anElement text: anItem asString ];
		items: aCollection.
	
	aList enqueueTask: (BlTaskAction new action: [ 
		aScrollable := aList childNamed: #scrollable.
		aScrollable margin: aScrollable margin + (BlInsets bottom: 5) ]).
	
	^ aList
]

{ #category : #'examples - support' }
BrSimpleListExamples >> horizontalListFor: aCollection verticalListFor: aHorizontalBlock [
	<gtExample>
	| aList aScrollable |
	aList := BrSimpleList horizontal
		itemType: [ :aFactory :anItem :anIndex | 
			Integer ];
		itemStencil: [ :anItemType | 
			| aNestedList |
			aNestedList := self verticalListFor: #().
			aNestedList hFitContent. ];
		itemDataBinder: [ :anElement :anItem :anIndex | 
			| aNestedCollection |
			aNestedCollection := aHorizontalBlock cull: anItem cull: anIndex.
			anElement items: aNestedCollection ];
		items: aCollection.
	
	aList enqueueTask: (BlTaskAction new action: [ 
		aScrollable := aList childNamed: #scrollable.
		aScrollable margin: aScrollable margin + (BlInsets bottom:5) ]).
	
	^ aList
]

{ #category : #'examples - horizontal list' }
BrSimpleListExamples >> horizontalNumbers [
	<gtExample>
	| aList |
	aList := self horizontalListFor: (1 to: 1000).
	
	^ aList
]

{ #category : #'examples - support' }
BrSimpleListExamples >> label [
	<gtExample>
	| aLabel |
	aLabel := BrLabel new
		beHugeSize;
		look: BrGlamorousLabelLook.
	aLabel margin: aLabel margin + (BlInsets all: 5).
	aLabel padding: aLabel padding + (BlInsets top: 5 right: 10 bottom: 5 left: 10).
	aLabel border: (BlBorder paint: Color lightGray width: 1).
	aLabel geometry: (BlRoundedRectangleGeometry cornerRadius: 4).
	^ aLabel
]

{ #category : #'examples - nested lists' }
BrSimpleListExamples >> verticalAndHorizontalNumbers [
	<gtExample>
	| aList |
	aList := self 
		verticalListFor: (0 to: 10000 by: 100)
		horizontalListFor: [ :aNumber | aNumber to: aNumber + 99 ].
	^ aList
]

{ #category : #'examples - support' }
BrSimpleListExamples >> verticalListFor: aCollection [
	<gtExample>
	| aList aScrollable |
	aList := BrSimpleList vertical
		itemType: [ :aFactory :anItem :anIndex | 
			Integer ];
		itemStencil: [ :anItemType | 
			self label ];
		itemDataBinder: [ :anElement :anItem :anIndex | 
			anElement text: anItem asString ];
		items: aCollection.
	
	aList enqueueTask: (BlTaskAction new action: [ 
		aScrollable := aList childNamed: #scrollable.
		aScrollable margin: aScrollable margin + (BlInsets right: 5) ]).
	
	^ aList
]

{ #category : #'examples - support' }
BrSimpleListExamples >> verticalListFor: aCollection horizontalListFor: aHorizontalBlock [
	<gtExample>
	| aList aScrollable |
	aList := BrSimpleList vertical
		itemType: [ :aFactory :anItem :anIndex | 
			Integer ];
		itemStencil: [ :anItemType | 
			| aNestedList |
			aNestedList := self horizontalListFor: #().
			aNestedList vFitContent. ];
		itemDataBinder: [ :anElement :anItem :anIndex | 
			| aNestedCollection |
			aNestedCollection := aHorizontalBlock cull: anItem cull: anIndex.
			anElement items: aNestedCollection ];
		items: aCollection.
	
	aScrollable := aList childNamed: #scrollable.
	aScrollable margin: aScrollable margin + (BlInsets right: 5).
	
	^ aList
]

{ #category : #'examples - vertical list' }
BrSimpleListExamples >> verticalNumbers [
	<gtExample>
	| aList |
	aList := self verticalListFor: (1 to: 1000).
	
	^ aList
]
