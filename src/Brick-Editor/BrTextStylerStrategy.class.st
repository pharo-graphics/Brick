"
I am an abstract text styler strategy used by ${class:BrTextEditor}$.
My subclasses are responsible for the text style request executions.
For example, one strategy could perform styling in a background process, another in a UI process (and being therefore blocking).

The common methods are ${method:BrTextStylerStrategy>>#style:}$ and ${method:BrTextStylerStrategy>>#style:afterDo:}$.

See my subclasses for concrete strategies: ${class:BrTextStylerStrategy|expanded=true|show=gtSubclassesFor:}$


"
Class {
	#name : #BrTextStylerStrategy,
	#superclass : #Object,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#instVars : [
		'styler'
	],
	#category : #'Brick-Editor-Styler'
}

{ #category : #testing }
BrTextStylerStrategy class >> isAbstract [
	^ self name = #BrTextStylerStrategy 
]

{ #category : #styling }
BrTextStylerStrategy >> style: aBrText [
	self style: aBrText afterDo: [ "do nothing" ]
]

{ #category : #styling }
BrTextStylerStrategy >> style: aBlText afterDo: aBlock [
	self subclassResponsibility
]

{ #category : #styling }
BrTextStylerStrategy >> styleTextInEditor: aBrTextEditor afterDo: aBlock [
	self subclassResponsibility
]

{ #category : #accessing }
BrTextStylerStrategy >> styler [
	<return: #BlTextStyler>
	^ styler
]

{ #category : #accessing }
BrTextStylerStrategy >> styler: aBlTextStyler [
	self 
		assert: [ aBlTextStyler isNotNil ] 
		description: [ 'Text styler must be non-nil' ].
	styler := aBlTextStyler
]

{ #category : #accessing }
BrTextStylerStrategy >> view [
	"Strategies that need an widget to which the text editor (and therefore the styler) is attached to, can override the method"
	<return: #BlElement or: nil>
	^ nil
]

{ #category : #accessing }
BrTextStylerStrategy >> view: aBlElement [
	"Strategies that need an widget to which the text editor (and therefore the styler) is attached to, can override the method"

]
