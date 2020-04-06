"
I am a Glamorous vector icons container.

Each of my icon is a stencil that creates an actual element. It means that some icons can be parametrised.

Here is a list of available icons:

${class:BrGlamorousVectorIcons|show=gtIconsFor:|expanded=}$



"
Class {
	#name : #BrGlamorousVectorIcons,
	#superclass : #Object,
	#category : #'Brick-Glamorous'
}

{ #category : #utility }
BrGlamorousVectorIcons class >> allIcons [
	^ (self class methodsInProtocol: #icons)
		sort: [ :a :b | a selector < b selector ];
		collect: [ :eachCompiledMethod | 
			eachCompiledMethod selector -> (self perform: eachCompiledMethod selector) ]
]

{ #category : #icons }
BrGlamorousVectorIcons class >> checkbox [
	<script: 'self checkbox inspect'>

	^ [ BlElement new
		size: 16@16;
		geometry: (self crossGeometry: 0.22 extent: 1@1 origin: 0@0);
		background: Color black ] asStencil
]

{ #category : #'private - geometry' }
BrGlamorousVectorIcons class >> crossGeometry: aThickness extent: anExtent origin: anOrigin [
	<return: #BlGeometry>
	| cathetus w h halfW halfH |
	
	cathetus := (2 sqrt / 2.0) * aThickness.
	w := anExtent x.
	halfW := w / 2.0.
	h := anExtent y.
	halfH := h / 2.0.
	
	^ BlNormalizedPolygon vertices: ({
		cathetus @ 0.
		halfW @ (halfH - cathetus).
		(w - cathetus) @ 0.
		w @ cathetus.
		(halfW + cathetus) @ halfH.
		w @ (h - cathetus).
		(w - cathetus) @ h.
		halfW @ (halfH + cathetus).
		cathetus @ h.
		0 @ (h - cathetus).
		(halfW - cathetus) @ halfH.
		0 @ cathetus
	} collect: [ :eachVertex | eachVertex + anOrigin ])
]

{ #category : #'gt-extension' }
BrGlamorousVectorIcons class >> gtIconsFor: aView [
	<gtView>
	^ aView list
			title: 'Icons';
			priority: -10;
			items: self allIcons;
			itemStencil: [ :eachIcon | 
				BlElement new
					layout: BlLinearLayout horizontal;
					margin: (BlInsets all: 3);
					constraintsDo: [ :c | c vertical fitContent ];
					addChild: eachIcon value asElement;
					addChild: (BlTextElement new 
						text: eachIcon key asString asRopedText;
						padding: (BlInsets left: 6 right: 3)) ]
]
