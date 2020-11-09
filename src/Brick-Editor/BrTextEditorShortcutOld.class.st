"
The difference between me and ${class:BlShortcut}$ is that I only allow clean ${class:BlockClosure}$ and pass two extra optional parameter: a text editor and a previously provided optional object
"
Class {
	#name : #BrTextEditorShortcutOld,
	#superclass : #Object,
	#instVars : [
		'combination',
		'action',
		'shortcut',
		'options',
		'repeatable'
	],
	#category : #'Brick-Editor-Model'
}

{ #category : #'instance creation' }
BrTextEditorShortcutOld class >> fromAssociation: anAssociation [
	^ self new
		combination: anAssociation key;
		action: anAssociation value
]

{ #category : #'instance creation' }
BrTextEditorShortcutOld class >> fromShortcut: aBlShortcut [
	^ self new
		combination: aBlShortcut combination;
		action: [ :aTextEditor :aShortcutEvent :aShortcut | aShortcut performDueTo: aShortcutEvent ]
]

{ #category : #testing }
BrTextEditorShortcutOld class >> isDeprecated [
	^ true
]

{ #category : #comparing }
BrTextEditorShortcutOld >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ combination = anObject combination
		and: [ action = anObject action ]
]

{ #category : #accessing }
BrTextEditorShortcutOld >> action [
	^ action
]

{ #category : #accessing }
BrTextEditorShortcutOld >> action: aBlockClosure [
	"aBlockClosure is an action in a form [ :aShortcutEvent :aShortcut :aTextEditor :theOptions | ]"
	<argument: #aBlockClosure satisfies: #isClean>
	<argument: #aBlockClosure satisfies: #isClosure>
	
	action := aBlockClosure
]

{ #category : #converting }
BrTextEditorShortcutOld >> asShortcut [
	<return: #BlShortcutWithAction>

	^ shortcut ifNil: [
		shortcut := BlShortcutWithAction new
			combination: self combination;
			repeatable: self repeatable;
			action: [ :aShortcutEvent :aShortcut | self action
				cull: aShortcutEvent
				cull: aShortcut
				cull: aShortcutEvent currentTarget editor
				cull: options ] ]
]

{ #category : #accessing }
BrTextEditorShortcutOld >> combination [
	^ combination
]

{ #category : #accessing }
BrTextEditorShortcutOld >> combination: anObject [
	combination := anObject
]

{ #category : #accessing }
BrTextEditorShortcutOld >> gtSourceCodeFor: aView [
	<gtView>
	^ self action gtSourceCodeFor: aView
]

{ #category : #comparing }
BrTextEditorShortcutOld >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ combination hash bitXor: action hash
]

{ #category : #initialization }
BrTextEditorShortcutOld >> initialize [
	super initialize.

	repeatable := true.
	action := [ :aShortcutEvent :aShortcut :aTextEditor :theOptions | ]
]

{ #category : #accessing }
BrTextEditorShortcutOld >> options [
	^ options
]

{ #category : #accessing }
BrTextEditorShortcutOld >> options: anObject [
	options := anObject
]

{ #category : #copying }
BrTextEditorShortcutOld >> postCopy [
	combination := combination copy.
	action := action cleanCopy
]

{ #category : #accessing }
BrTextEditorShortcutOld >> repeatable [
	^ repeatable
]

{ #category : #accessing }
BrTextEditorShortcutOld >> repeatable: aBoolean [
	repeatable := aBoolean
]

{ #category : #printing }
BrTextEditorShortcutOld >> storeOn: aStream [
	aStream
		nextPut: $(;
		nextPutAll: self class name; space; nextPutAll: 'new'; space;
		nextPutAll: #combination:; space;
		store: combination; nextPut: $;; space;
		nextPutAll: #action:; space;
		print: action;
		nextPut: $)
]
