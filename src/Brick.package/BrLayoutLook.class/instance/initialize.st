initialization
initialize
	super initialize.

	"if target name is not set, look is applied on a #widget"
	targetName := nil.

	layout := BlBasicLayout new.

	horizontalResizer := BlLayoutResizer fitContent.
	verticalResizer := BlLayoutResizer fitContent.

	horizontalAlignment := BlNullAlignment horizontal.
	verticalAlignment := BlNullAlignment vertical.

	consraintsBlock := [ :c | ]