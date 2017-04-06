initialization
initialize
	super initialize.
	
	initializeElementBlock := [ BrFormElement new ].
	bindBlock := [ :anElement :aDisplayedValue |
		| composite morph |
		composite := GLMCompositePresentation new.
	
		aDisplayedValue perform: self selector with: composite.
		composite presentations last title: nil.
		composite startOn: aDisplayedValue.
		morph := composite renderGlamorouslyOn: GLMRenderer subclasses first new.
		morph extent: self extent.

		anElement size: morph extent.
		anElement form: morph imageForm ].
	
	selector := #gtInspectorRawIn:.
	extent := 400@100