Class {
	#name : #BaselineOfNewBrick,
	#superclass : #BaselineOf,
	#category : #BaselineOfNewBrick
}

{ #category : #baseline }
BaselineOfNewBrick >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'NewBloc' with: [
				spec repository: 'github://pharo-graphics/Bloc/src' ];
			baseline: 'NewBlocPac' with: [
				spec repository: 'github://pharo-graphics/bloc-pac:main/src' ].
			
		spec
			package: #'Brick-Core' with: [
				spec requires: #('NewBloc' 'NewBlocPac') ];
			package: #'Brick-Editor' with: [
				spec requires: #('Brick-Core') ];
			
			package: #'Brick' with: [
				spec requires: #(#'Brick-Core' #'Brick-Editor') ];
			package: #'Brick-Theme' with: [
				spec requires: #(#'Brick') ];
			
			package: #'Brick-Glamorous' with: [
				spec requires: #(#'Brick') ];
			
			package: #'Brick-DevTool' with: [
				spec requires: #(#'Brick' #'NewBloc' #'NewBlocPac') ]
		]
]
