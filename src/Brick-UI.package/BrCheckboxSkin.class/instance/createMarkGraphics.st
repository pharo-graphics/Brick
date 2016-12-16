as yet unclassified
createMarkGraphics
	| icon |
	icon := BlElement new.
	icon addStyleClass: #mark.
	icon background: Color black.
	icon constraints linear vertical alignCenter.
	icon constraints linear horizontal alignCenter.
	^ icon