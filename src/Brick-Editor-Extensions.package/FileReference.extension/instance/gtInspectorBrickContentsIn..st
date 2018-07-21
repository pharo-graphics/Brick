*Brick-Editor-Extensions
gtInspectorBrickContentsIn: composite
	<gtInspectorPresentationOrder: 0>
	^ composite blocText
		title: '_Contents';
		display: [ 
			self readStreamDo: [ :stream | 
				| result |
				result := [stream contents ]
					on: Error 
					do: [ (stream binary next: 10000) asString ] ] ];
"			withLineNumbers: true;"
		"act: [ :text |
			self ensureDelete; writeStreamDo: [ :s | s nextPutAll: text text asString ] ]
			icon: GLMUIThemeExtraIcons glamorousSave
			on: $s
			entitled: 'Save';"
		when: [ self isFile ]