as yet unclassified
customEditor
	<gtExample>

	^ BrEditorElement new
		editor: (BrTextEditor new
			text: ('Hello', String cr, 'World') asRopedText;
			segmentBuilderDo: [ :aSegmentBuilder | aSegmentBuilder wordStencil: [ :aText :anEditorElement |
				BlElement new
					layout: BlLinearLayout horizontal;
					border: (BlBorder paint: (Color blue alpha: 0.4) width: 1);
					constraintsDo: [ :c |
						c horizontal fitContent.
						c vertical fitContent ];
					addChildren: (aText withIndexCollect: [ :aCharacter :anIndex |
						BlScalableElement new
							size: self characterExtent;
							border: (BlBorder paint: (Color gray alpha: 0.2) width: 1);
							contentElement: (BlTextElement text: aCharacter asRopedText);
							when: BlMouseEnterEvent do: [ :anEvent | anEvent currentTarget background: (Color gray alpha: 0.2) ];
							when: BlMouseLeaveEvent do: [ :anEvent | anEvent currentTarget background: (Color transparent) ];
							when: BlClickEvent do: [ :anEvent |
								anEditorElement requestFocus.
								anEditorElement editor
									moveCursorTo: aText start - 1 + anIndex - (anEvent localPosition x < (anEvent currentTarget width / 2.0)) asBit ] ]);
					addEventHandler: (anEditorElement editor textEditListener);
					when: BrTextEditorShowCursorRequest do: [ :aRequest |
						| aCursor aColor |
						
						aColor := aRequest hasFocus
							ifTrue: [ Color black ]
							ifFalse: [ Color lightGray ].
						
						aCursor := BlElement new size: 4 @ self characterExtent y * 2; background: aColor.
						aRequest currentTarget addChild: aCursor at: aRequest cursorPosition + 1 ];
					when: BrTextEditorHideCursorRequest do: [ :aRequest |
						aRequest currentTarget removeChildAt: aRequest cursorPosition + 1
					] ] ]);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ]