"
I create a label only element to be used within a list widget, both in a simple and columned lists.

[[[
| aStencil anElement |

aStencil := BrColumnCellLabelStencil new.
aStencil text: 'List row'.
anElement := aStencil create

]]]
"
Class {
	#name : #BrColumnCellLabelStencil,
	#superclass : #BrStencil,
	#instVars : [
		'text'
	],
	#category : #'Brick-Column - Stencil'
}

{ #category : #'instance creation' }
BrColumnCellLabelStencil class >> fitContent: aText [
	^ BlTextElement new
		margin: (BlInsets all: 3);
		text: aText asRopedText;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent ]
]

{ #category : #'instance creation' }
BrColumnCellLabelStencil class >> matchParent: aText [
	^ BlTextElement new
		margin: (BlInsets all: 3);
		text: aText asRopedText;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ]
]

{ #category : #'api - instantiation' }
BrColumnCellLabelStencil >> create [
	^ BrLabel new
		aptitude: BrGlamorousListLabelAptitude;
		margin: (BlInsets all: 3);
		text: self text;
		hMatchParent;
		vFitContent
]

{ #category : #initialization }
BrColumnCellLabelStencil >> initialize [
	super initialize.
	
	text := 'Label' asRopedText
]

{ #category : #accessing }
BrColumnCellLabelStencil >> text [
	<return: #BlText>

	^ text
]

{ #category : #accessing }
BrColumnCellLabelStencil >> text: aBrTextOrString [
	text := aBrTextOrString asRopedText
]
