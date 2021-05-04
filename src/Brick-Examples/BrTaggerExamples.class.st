Class {
	#name : #BrTaggerExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Tagger'
}

{ #category : #'instance creation' }
BrTaggerExamples >> newGlamorousTagger [
	<gtExample>

	^ BrTagger new
		aptitude: BrGlamorousTaggerEditableAptitude new;
		namedTags: { 'How' . 'Are' . 'You' };
		when: BrTaggerAddTagRequest do: [ :aRequest |
			aRequest tag name
				ifNotEmpty: [ aRequest currentTarget addTag: aRequest tag ] ];
		when: BrTaggerRemoveTagRequest do: [ :aRequest |
			aRequest currentTarget removeTag: aRequest tag ];
		when: BrTaggerRenameTagRequest do: [ :aRequest |
			aRequest newName trimmed
				ifEmpty: [ aRequest currentTarget removeTag: aRequest tag ]
				ifNotEmpty: [ :aNewName | aRequest currentTarget renameTag: aRequest tag to: aNewName ] ]
]

{ #category : #'instance creation' }
BrTaggerExamples >> newGlamorousTaggerWithExplicitTags [
	<gtExample>

	^ BrTagger new
		aptitude: (BrGlamorousTaggerSelectableAptitude new);
		explicitAllowedTags: { BrExampleTaggerCatTag new . BrExampleTaggerDogTag new };
		when: BrTaggerAddTagRequest do: [ :aRequest |
			aRequest tag name
				ifNotEmpty: [ aRequest currentTarget addTag: aRequest tag ] ];
		when: BrTaggerRemoveTagRequest do: [ :aRequest |
			aRequest currentTarget removeTag: aRequest tag ];
		when: BrTaggerRenameTagRequest do: [ :aRequest |
			aRequest newName trimmed
				ifEmpty: [ aRequest currentTarget removeTag: aRequest tag ]
				ifNotEmpty: [ :aNewName | aRequest currentTarget renameTag: aRequest tag to: aNewName ] ]
]
