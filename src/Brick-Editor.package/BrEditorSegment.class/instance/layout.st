accessing
layout
	"Return a layout that an element representing this segment should have"
	<return: #BlLayout>

	^ self builder layoutBlock cull: self entity