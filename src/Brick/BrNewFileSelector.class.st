Class {
	#name : #BrNewFileSelector,
	#superclass : #BrFileSelector,
	#instVars : [
		'fileInputField'
	],
	#category : #'Brick-File - UI'
}

{ #category : #accessing }
BrNewFileSelector >> buildUI [
	| alignedButton fileInputFieldLabel |
	breadcrumb := self createBreadcrumb.
	table := self createTable.
	alignedButton := self createOkButton.
	fileInputField := self createFileInputField.
	self addChildren: {
		BrScrollPane new
			look: BrScrollPaneLook;
			hMatchParent;
			vFitContent;
			content: breadcrumb.
		table.
		fileInputField.
		alignedButton. }.
]

{ #category : #accessing }
BrNewFileSelector >> createFileInputField [
	|label fileInputFieldLabel |
	fileInputFieldLabel := self createFileInputFieldLabel .
	label := BrEditableLabel new.
	label look: BrGlamorousEditableLabelLook.
	label hMatchParent.
	label editor
		when: BrTextEditorModifiedEvent
		do: [ :anEvent | 
				(folder / anEvent text asString) exists
						ifTrue: [ okButton disable ];
						ifFalse: [  okButton enable ]].
	label switchToEditor.
	
	^ BrHorizontalPane new 
		hMatchParent; 
		vFitContent;
		margin: (BlInsets top: 10); 
		addChild:fileInputFieldLabel; 
		addChild:label

	
]

{ #category : #accessing }
BrNewFileSelector >> createFileInputFieldLabel [
	^ BrLabel new text:'New file name:'; 
		addLook: (BrGlamorousLabelLook new foreground: Color gray);
		fitContent;
		margin: (BlInsets right: 5).
]

{ #category : #accessing }
BrNewFileSelector >> executeAction [ 
	"Execute the receiver's load action"
	| selectedIndices newFile|
	newFile := (folder / fileInputField text asString) ensureCreateFile. 
	self updateDisplay.
	fileInputField text:''.
	^ self okAction 
				cull: newFile
				cull: okButton.
]
