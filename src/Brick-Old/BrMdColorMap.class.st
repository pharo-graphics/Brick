Class {
	#name : #BrMdColorMap,
	#superclass : #Object,
	#instVars : [
		'colorMap'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Brick-Old'
}

{ #category : #'as yet unclassified' }
BrMdColorMap class >> initialize [
	super initialize.
	self uniqueInstance
]

{ #category : #'as yet unclassified' }
BrMdColorMap class >> reset [
	super cleanUp.
	uniqueInstance := nil
]

{ #category : #'as yet unclassified' }
BrMdColorMap class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #'as yet unclassified' }
BrMdColorMap >> atColor: aSymbol add: anAssoc [
	(colorMap at: aSymbol ifAbsentPut: [ Dictionary new ])
		at: anAssoc key
		put: (BrMdColor fromHexString: anAssoc value)
]

{ #category : #'as yet unclassified' }
BrMdColorMap >> color: aSymbol intensity: anInteger [
	^ ((colorMap at: aSymbol) at: anInteger)
		colorName: (aSymbol , anInteger asString) asSymbol;
		yourself
]

{ #category : #'as yet unclassified' }
BrMdColorMap >> initialize [
	super initialize.
	colorMap := Dictionary new.
	(Pragma allNamed: #loadColor in: self class)
		do: [ :pragma | (Message selector: pragma methodSelector) sendTo: self ]
]

{ #category : #'as yet unclassified' }
BrMdColorMap >> loadBlue [
	<loadColor>
	self
		atColor: #blue add: 50 -> 'e3f2fd';
		atColor: #blue add: 100 -> 'bbdefb';
		atColor: #blue add: 200 -> '90caf9';
		atColor: #blue add: 300 -> '64b5f6';
		atColor: #blue add: 400 -> '42a5f5';
		atColor: #blue add: 500 -> '2196f3';
		atColor: #blue add: 600 -> '1e88e5';
		atColor: #blue add: 700 -> '1976d2';
		atColor: #blue add: 800 -> '1565c0';
		atColor: #blue add: 900 -> '0d47a1'
]

{ #category : #'as yet unclassified' }
BrMdColorMap >> loadGreen [
	<loadColor>
	self
		atColor: #green add: 50 -> 'e8f5e9';
		atColor: #green add: 100 -> 'c8e6c9';
		atColor: #green add: 200 -> 'a5d6a7';
		atColor: #green add: 300 -> '81c784';
		atColor: #green add: 400 -> '66bb6a';
		atColor: #green add: 500 -> '4caf50';
		atColor: #green add: 600 -> '43a047';
		atColor: #green add: 700 -> '388e3c';
		atColor: #green add: 800 -> '2e7d32';
		atColor: #green add: 900 -> '1b5e20'
]

{ #category : #'as yet unclassified' }
BrMdColorMap >> loadGrey [
	<loadColor>
	self
		atColor: #grey add: 50 -> 'fafafa';
		atColor: #grey add: 100 -> 'f5f5f5';
		atColor: #grey add: 200 -> 'eeeeee';
		atColor: #grey add: 300 -> 'e0e0e0';
		atColor: #grey add: 400 -> 'bdbdbd';
		atColor: #grey add: 500 -> '9e9e9e';
		atColor: #grey add: 600 -> '757575';
		atColor: #grey add: 700 -> '616161';
		atColor: #grey add: 800 -> '424242';
		atColor: #grey add: 900 -> '212121'
]

{ #category : #'as yet unclassified' }
BrMdColorMap >> loadPink [
	<loadColor>
	self
		atColor: #pink add: 50 -> 'fce4ec';
		atColor: #pink add: 100 -> 'f8bbd0';
		atColor: #pink add: 200 -> 'f48fb1';
		atColor: #pink add: 300 -> 'f06292';
		atColor: #pink add: 400 -> 'ec407a';
		atColor: #pink add: 500 -> 'e91e63';
		atColor: #pink add: 600 -> 'd81b60';
		atColor: #pink add: 700 -> 'c2185b';
		atColor: #pink add: 800 -> 'ad1457';
		atColor: #pink add: 900 -> '880e4f'
]

{ #category : #'as yet unclassified' }
BrMdColorMap >> loadPurple [
	<loadColor>
	self
		atColor: #purple add: 50 -> 'f3e5f5';
		atColor: #purple add: 100 -> 'e1bee7';
		atColor: #purple add: 200 -> 'ce93d8';
		atColor: #purple add: 300 -> 'ba68c8';
		atColor: #purple add: 400 -> 'ab47bc';
		atColor: #purple add: 500 -> '9c27b0';
		atColor: #purple add: 600 -> '8e24aa';
		atColor: #purple add: 700 -> '7b1fa2';
		atColor: #purple add: 800 -> '6a1b9a';
		atColor: #purple add: 900 -> '4a148c'
]

{ #category : #'as yet unclassified' }
BrMdColorMap >> loadRed [
	<loadColor>
	self
		atColor: #red add: 50 -> 'ffebee';
		atColor: #red add: 100 -> 'ffcdd2';
		atColor: #red add: 200 -> 'ef9a9a';
		atColor: #red add: 300 -> 'e57373';
		atColor: #red add: 400 -> 'ef5350';
		atColor: #red add: 500 -> 'f44336';
		atColor: #red add: 600 -> 'e53935';
		atColor: #red add: 700 -> 'd32f2f';
		atColor: #red add: 800 -> 'c62828';
		atColor: #red add: 900 -> 'b71c1c'
]
