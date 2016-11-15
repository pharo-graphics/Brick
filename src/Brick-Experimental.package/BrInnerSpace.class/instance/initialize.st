initialize-release
initialize
	super initialize.
	self layout: BlLinearLayout vertical.
	self root: BlElement new.
	self constraints horizontal fitContent.
	self constraints vertical fitContent.
	self border: (BlBorder color: (Color black alpha: 0.2) width: 2 radius: 2).
	"self padding: (BlInsets all: 1)."
	"self
		effect:
			(BlDropShadowEffect new
				offset: 0.5 @ 0.5;
				width: 1;
				color: (Color black alpha: 0.5))."
	self
		addEventHandler: BrResizeEventListener new