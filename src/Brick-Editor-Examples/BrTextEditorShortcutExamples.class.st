Class {
	#name : #BrTextEditorShortcutExamples,
	#superclass : #Object,
	#category : #'Brick-Editor-Examples-Model'
}

{ #category : #'examples - shortcuts' }
BrTextEditorShortcutExamples >> shortcutOnLeftArrowWithEditorAction [
	<gtExample>
	| aShortcut |
	
	aShortcut := BrTextEditorShortcut new
		combination: BlKeyCombination arrowLeft;
		action: [ :aTextEditor | aTextEditor selector all select ].

	^ aShortcut
]

{ #category : #'examples - shortcuts' }
BrTextEditorShortcutExamples >> shortcutOnLeftArrowWithEmptyAction [
	<gtExample>
	| aShortcut |
	
	aShortcut := BrTextEditorShortcut new
		combination: BlKeyCombination arrowLeft;
		action: [  ].

	^ aShortcut
]

{ #category : #'examples - store' }
BrTextEditorShortcutExamples >> storeShortcutOnLeftArrowWithEditorAction [
	<gtExample>
	| aShortcut aStoreString aRestoredShortcut |
	
	aShortcut := self shortcutOnLeftArrowWithEditorAction.
	aStoreString := aShortcut storeString.

	self assert: aStoreString equals: '(BrTextEditorShortcut new combination: (BlCompulsoryCombination new with: (BlKeyboardKey new setName: #ArrowLeft; setValue: nil) asKeyCombination); action: [ :aTextEditor | aTextEditor selector all select ])'.
	
	aRestoredShortcut := Object evaluate: aStoreString.
	self assert: aRestoredShortcut combination equals: aShortcut combination.
	
	^ aStoreString
]

{ #category : #'examples - store' }
BrTextEditorShortcutExamples >> storeShortcutOnLeftArrowWithEmptyAction [
	<gtExample>
	| aShortcut aStoreString aRestoredShortcut |
	
	aShortcut := self shortcutOnLeftArrowWithEmptyAction.
	aStoreString := aShortcut storeString.
	
	self assert: aStoreString equals: '(BrTextEditorShortcut new combination: (BlCompulsoryCombination new with: (BlKeyboardKey new setName: #ArrowLeft; setValue: nil) asKeyCombination); action: [  ])'.
	
	aRestoredShortcut := Object evaluate: aStoreString.
	self assert: aRestoredShortcut combination equals: aShortcut combination.
	
	^ aStoreString
]
