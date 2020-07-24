Extension { #name : #BrWidgetModel }

{ #category : #'*Brick-DevTool' }
BrWidgetModel class >> allRelatedViewModels [
	^ { }
]

{ #category : #'*Brick-DevTool' }
BrWidgetModel class >> withAllSuperclassChangeEvents [
	<return: #Set of: #'BrChangeEvent class'>

	^ ((self withAllSuperclassModels
		flatCollect: [ :eachLookClass | eachLookClass referencedClasses
			select: [ :eachReferencedClass | eachReferencedClass isKindOf: BrChangeEvent class ] ]) as: Set) asArray
]

{ #category : #'*Brick-DevTool' }
BrWidgetModel class >> withAllSuperclassModels [
	| theModels |
	
	theModels := OrderedCollection with: self.
	
	self = BrWidgetModel
		ifTrue: [ ^ theModels ].

	theModels
		addAll: (self allSuperclassesIncluding: BrWidgetModel);
		yourself.
		
	^ theModels
]

{ #category : #'*Brick-DevTool' }
BrWidgetModel class >> withAllSuperclassRequests [
	<return: #Set of: #'BrRequest class'>

	^ ((self withAllSuperclassModels
		flatCollect: [ :eachLookClass | eachLookClass referencedClasses
			select: [ :eachReferencedClass | eachReferencedClass isKindOf: BrRequest class ] ]) as: Set) asArray
]
