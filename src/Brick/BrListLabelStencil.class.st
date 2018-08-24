"
I create a label only element to be used within a list widget, both in a simple and columned lists.

[[[
| aStencil anElement |

aStencil := BrListLabelStencil new.
aStencil text: 'List row'.
anElement := aStencil create

]]]
"
Class {
	#name : #BrListLabelStencil,
	#superclass : #BrStencil,
	#instVars : [
		'text'
	],
	#category : 'Brick-List - Stencil'
}

{ #category : #'instance creation' }
BrListLabelStencil class >> fitContent: aText [
	^ BlTextElement new
		margin: (BlInsets all: 3);
		text: aText asRopedText;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent ]
]

{ #category : #'instance creation' }
BrListLabelStencil class >> matchParent: aText [
	^ BlTextElement new
		margin: (BlInsets all: 3);
		text: aText asRopedText;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ]
]

{ #category : #'api - instantiation' }
BrListLabelStencil >> create [
	^ BlTextElement new
		margin: (BlInsets all: 3);
		text: self text;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ]
]

{ #category : #initialization }
BrListLabelStencil >> initialize [
	super initialize.
	
	text := 'Label' asRopedText
]

{ #category : #accessing }
BrListLabelStencil >> text [
	<return: #BlText>

	^ text
]

{ #category : #accessing }
BrListLabelStencil >> text: aBrTextOrString [
	text := aBrTextOrString asRopedText
]
