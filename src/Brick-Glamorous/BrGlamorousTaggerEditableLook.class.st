Class {
	#name : #BrGlamorousTaggerEditableLook,
	#superclass : #BrTaggerLook,
	#instVars : [
		'tags',
		'shouldGiveFocusToNewTag'
	],
	#category : #'Brick-Glamorous-Tagger'
}

{ #category : #private }
BrGlamorousTaggerEditableLook >> addTagCreatorElement [
	tags
		addChild: self newTagCreatorElement
		at: tags children size
]

{ #category : #private }
BrGlamorousTaggerEditableLook >> assignTag: aTaggerTag toElement: aTagElement [
	aTagElement userData at: #brickTaggerTag put: aTaggerTag
]

{ #category : #private }
BrGlamorousTaggerEditableLook >> giveFocusToNewTagDuring: aBlock [
	| previousValue |
	
	previousValue := shouldGiveFocusToNewTag.
	shouldGiveFocusToNewTag := true.
	aBlock ensure: [ shouldGiveFocusToNewTag := previousValue ]
]

{ #category : #initialization }
BrGlamorousTaggerEditableLook >> initialize [
	super initialize.
	
	shouldGiveFocusToNewTag := false.

	tags := BlElement new layout: BlFlowLayout horizontal.
	tags addChild: self newAddTagButton.

	self addChangeAddChildAs: #(tags) with: [ tags ].	
	
	self
		addChangeProperty: #(widget layout)
			with: [ BlLinearLayout horizontal ].
	
	self add: BrHorizontalPaneLook new.
	self add: (BrLayoutResizerLook new
		inherit;
		inherit: tags)
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerEditableLook >> newAddTagButton [
	^ BrButton new
		look:
			(BrGlamorousButtonRectangularLook new +
			BrGlamorousButtonIconLook new +
			BrGlamorousWithLabelTooltipLook new + (BrInteractiveCommonLook new
				default: [ :aWidget |
					aWidget
						border: BlBorder empty;
						background: BrGlamorousColors neutralBackgroundColor ];
				hovered: [ :aWidget | aWidget background: BrGlamorousColors neutralBackgroundColor darker ];
				pressed: [ :aWidget | aWidget background: BrGlamorousColors neutralBackgroundColor darker darker ];
				focused: [ :aWidget | aWidget border: (BlBorder paint: BrGlamorousColors focusedEditorBorderColor width: 1) ]));
		icon: BrGlamorousIcons add;
		label: 'Add';
		beSmall;
		hExact: 20;
		constraintsDo: [ :c | c flow vertical alignCenter ];
		action: [ :aButton | self addTagCreatorElement ];
		addShortcut: (BlShortcut new
			combination: BlKeyCombination arrowLeft;
			action: [ :anEvent | anEvent currentTarget previousSiblingDo: [ :anElement | anElement requestFocus ] ]);
		addShortcut: (BlShortcut new
			combination: BlKeyCombination return;
			action: [ :anEvent | self addTagCreatorElement ])
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerEditableLook >> newTagCreatorElement [
	| aNewTagCreator |

	aNewTagCreator := BrEditableLabel new
		look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
		text: '';
		requestFocus;
		switchToEditor;
		padding: (BlInsets top: 5 left: 10 bottom: 5 right: 10);
		constraintsDo: [ :c | c flow vertical alignCenter ];
		when: BrEditorAcceptWish do: [ :aWish |
			aWish currentTarget removeFromParent.
			self giveFocusToNewTagDuring: [ self dispatchEvent: (BrTaggerAddTagRequest new tag: (BrTaggerTag named: aWish text asString)) ] ];
		when: BrEditorCancelWish do: [ :anEvent |
			anEvent currentTarget focusPrevious.
			anEvent currentTarget removeFromParent ].

	aNewTagCreator navigator
		moveTo: 0;
		apply.
		
	^ aNewTagCreator
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerEditableLook >> newTagElementFor: aTaggerTag [
	<return: #BlElement>

	^ BrEditableLabel new
		look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
		text: aTaggerTag name;
		margin: (BlInsets top: 2 left: 0 bottom: 2 right: 2);
		when: BrEditorAcceptWish do: [ :aWish |
			aWish currentTarget text: aTaggerTag name.
			self widgetDo: [ :aWidget |
				aWidget dispatchEvent: (BrTaggerRenameTagRequest new tag: aTaggerTag; newName: aWish text asString) ] ];
		whenKey: BlKeyCombination backspace labelDo: [ :anEvent | self widgetDo: [ :aWidget | aWidget dispatchEvent: (BrTaggerRemoveTagRequest new tag: aTaggerTag) ] ]
]

{ #category : #hooks }
BrGlamorousTaggerEditableLook >> onTagAdded: aTaggerTag at: anIndex [
	| aTagElement |

	aTagElement := self newTagElementFor: aTaggerTag.
	self assignTag: aTaggerTag toElement: aTagElement.		
	tags addChild: aTagElement at: anIndex.
	
	shouldGiveFocusToNewTag
		ifTrue: [ aTagElement requestFocus ]
]

{ #category : #hooks }
BrGlamorousTaggerEditableLook >> onTagRemoved: aTaggerTag at: anIndex [
	self
		tagElementFor: aTaggerTag
		ifFound: [ :anElement |
			anElement hasFocus
				ifTrue: [
					anIndex = 1
						ifFalse: [ anElement focusPrevious ]
						ifTrue: [ anElement focusNext ] ].
			anElement removeFromParent ]
]

{ #category : #hooks }
BrGlamorousTaggerEditableLook >> onTagRenamed: aTaggerTag to: aNewName [
	self
		tagElementFor: aTaggerTag
		ifFound: [ :aTagElement | aTagElement text: aNewName ]
]

{ #category : #hooks }
BrGlamorousTaggerEditableLook >> onTagsChanged: theTags [
	tags removeChildren: self tagElements.
	theTags withIndexDo: [ :eachTag :eachIndex | self onTagAdded: eachTag at: eachIndex ]
]

{ #category : #private }
BrGlamorousTaggerEditableLook >> tagElementFor: aTaggerTag ifFound: aFoundBlock [
	tags children
		detect: [ :eachTagElement |
			eachTagElement userData
				at: #brickTaggerTag
				ifPresent: [ :eachTag | eachTag == aTaggerTag ]
				ifAbsent: [ false ] ]
		ifFound: aFoundBlock
]

{ #category : #private }
BrGlamorousTaggerEditableLook >> tagElements [
	^ tags children
		select: [ :eachTagElement |
			eachTagElement userData
				at: #brickTaggerTag
				ifPresent: [ true ]
				ifAbsent: [ false ] ]
]
