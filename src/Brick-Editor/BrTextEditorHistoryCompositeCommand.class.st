"
Sometimes multiple commands should be grouped in one undo/redo sequence
"
Class {
	#name : #BrTextEditorHistoryCompositeCommand,
	#superclass : #BrTextEditorHistoryCommand,
	#instVars : [
		'commands'
	],
	#category : #'Brick-Editor-History'
}

{ #category : #initialization }
BrTextEditorHistoryCompositeCommand >> addCommand: aCommand [
	"Commands should be added in the order they are performed in the editor"

	commands add: aCommand
]

{ #category : #accessing }
BrTextEditorHistoryCompositeCommand >> commands [
	^ commands
]

{ #category : #initialization }
BrTextEditorHistoryCompositeCommand >> initialize [
	super initialize.
	
	commands := OrderedCollection new
]

{ #category : #testing }
BrTextEditorHistoryCompositeCommand >> isGroup [
	^ true
]

{ #category : #'api - undo/redo' }
BrTextEditorHistoryCompositeCommand >> redoOn: aBrTextEditor [
	commands do: [ :eachCommand | eachCommand redoOn: aBrTextEditor ]
]

{ #category : #'api - undo/redo' }
BrTextEditorHistoryCompositeCommand >> undoOn: aBrTextEditor [
	commands reverseDo: [ :eachCommand | eachCommand undoOn: aBrTextEditor ]
]
