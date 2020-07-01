"
I am a tab switcher look that position tabs at top-center part of container.

I expect to be attached to a ${class:BrTabGroup}$ instance.

!! Examples 
!!! With Labels
${example:BrExamplesShowroom>>#glamorousTabsSwitcherWithLabels|codeExpanded=false|previewExpanded=true}$

!!! With Icons
${example:BrExamplesShowroom>>#glamorousTabsSwitcherWithIcons|codeExpanded=false|previewExpanded=true}$

"
Class {
	#name : #BrGlamorousTabGroupSwitcherLook,
	#superclass : #BrLook,
	#instVars : [
		'headerLook'
	],
	#category : #'Brick-Glamorous-Tabs - Switcher'
}

{ #category : #'api - style' }
BrGlamorousTabGroupSwitcherLook >> headerBackground: aBackground [
	headerLook headerDo: [ :aHeaderElement | aHeaderElement background: aBackground ]
]

{ #category : #initialization }
BrGlamorousTabGroupSwitcherLook >> initialize [
	super initialize.

	self addAll: {
		BrTabGroupContentLook new.
		headerLook := self newHeaderLook.
		BrLayoutResizerLook inherit }.
	
	headerLook headerDo: [ :aHeader | 
		aHeader 
			constraintsDo: [ :c | 
				c ignoreByLayout.
				c ignored horizontal alignCenter.
				c ignored vertical alignCenterAt: 0 ] ].
	
	self addChangeProperty: #(widget clipChildren) with: [ false ].
	self addChangeProperty: #(widget layout) with: [ BlLinearLayout vertical ].
]

{ #category : #'instance creation' }
BrGlamorousTabGroupSwitcherLook >> newHeaderLook [
	^ BrGlamorousTabGroupSwitcherHeaderLook new
]
