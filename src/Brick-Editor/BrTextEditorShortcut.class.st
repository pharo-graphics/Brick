"
The difference between me and ${class:BlShortcut}$ is that I only allow clean ${class:BlockClosure}$ and pass two extra optional parameter: a text editor and a previously provided optional object
"
Class {
	#name : #BrTextEditorShortcut,
	#superclass : #Object,
	#instVars : [
		'combination',
		'action',
		'shortcut',
		'options',
		'repeatable',
		'isOverwritableByMode'
	],
	#category : #'Brick-Editor-Model'
}

{ #category : #'instance creation' }
BrTextEditorShortcut class >> fromAssociation: anAssociation [
	^ self new
		combination: anAssociation key;
		action: anAssociation value
]

{ #category : #'instance creation' }
BrTextEditorShortcut class >> fromShortcut: aBlShortcut [
	^ self new
		combination: aBlShortcut combination;
		action: [ :aTextEditor :aShortcutEvent :aShortcut | aShortcut performDueTo: aShortcutEvent ]
]

{ #category : #comparing }
BrTextEditorShortcut >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ combination = anObject combination
		and: [ action = anObject action ]
]

{ #category : #accessing }
BrTextEditorShortcut >> action [
	^ action
]

{ #category : #accessing }
BrTextEditorShortcut >> action: aBlockClosure [
	"aBlockClosure is an action in a form [ :aShortcutEvent :aShortcut :aTextEditor :theOptions | ]"
	<argument: #aBlockClosure satisfies: #isClean>
	<argument: #aBlockClosure satisfies: #isClosure>
	
	action := aBlockClosure
]

{ #category : #converting }
BrTextEditorShortcut >> asShortcut [
	<return: #BlShortcut>

	^ shortcut ifNil: [
		shortcut := BlShortcut new
			combination: self combination;
			repeatable: self repeatable;
			action: [ :aShortcutEvent :aShortcut | self action
				cull: aShortcutEvent
				cull: aShortcut
				cull: aShortcutEvent currentTarget editor
				cull: options ] ]
]

{ #category : #accessing }
BrTextEditorShortcut >> beNotOverwritableByMode [
	isOverwritableByMode := false
]

{ #category : #accessing }
BrTextEditorShortcut >> beOverwritableByMode [
	isOverwritableByMode := true
]

{ #category : #accessing }
BrTextEditorShortcut >> combination [
	^ combination
]

{ #category : #accessing }
BrTextEditorShortcut >> combination: anObject [
	combination := anObject
]

{ #category : #comparing }
BrTextEditorShortcut >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ combination hash bitXor: action hash
]

{ #category : #initialization }
BrTextEditorShortcut >> initialize [
	super initialize.
	
	isOverwritableByMode := true.
	repeatable := true.
	action := [ :aShortcutEvent :aShortcut :aTextEditor :theOptions | ]
]

{ #category : #accessing }
BrTextEditorShortcut >> isOverwritableByMode [
	<return: #Boolean>

	^ isOverwritableByMode
]

{ #category : #accessing }
BrTextEditorShortcut >> options [
	^ options
]

{ #category : #accessing }
BrTextEditorShortcut >> options: anObject [
	options := anObject
]

{ #category : #copying }
BrTextEditorShortcut >> postCopy [
	combination := combination copy.
	action := action cleanCopy
]

{ #category : #accessing }
BrTextEditorShortcut >> repeatable [
	^ repeatable
]

{ #category : #accessing }
BrTextEditorShortcut >> repeatable: aBoolean [
	repeatable := aBoolean
]

{ #category : #printing }
BrTextEditorShortcut >> storeOn: aStream [
	aStream
		nextPut: $(;
		nextPutAll: self class name; space; nextPutAll: 'new'; space;
		nextPutAll: #combination:; space;
		store: combination; nextPut: $;; space;
		nextPutAll: #action:; space;
		print: action;
		nextPut: $)
]
