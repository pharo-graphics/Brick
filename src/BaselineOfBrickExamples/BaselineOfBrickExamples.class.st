Class {
	#name : #BaselineOfBrickExamples,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrickExamples
}

{ #category : #baseline }
BaselineOfBrickExamples >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			"baseline: 'PharoBootstrap' with: [ spec loads: #(#'KernelGroup' 'FileSystemGroup') ];"

			baseline: 'BlocCore' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocAnimation' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocLayout' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'BlocText' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			
			baseline: 'BlocPacAsyncElementExamples' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacInfinite' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacPullAndSlide' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];
			baseline: 'BlocPacScripter' with: [
				spec repository: 'github://feenkcom/bloc-pac:main/src' ];

			baseline: 'BrickCore' with: [
				spec repository: 'github://feenkcom/Brick/src' ];
			baseline: 'BrickWidgets' with: [
				spec repository: 'github://feenkcom/Brick/src' ];
			baseline: 'BrickEditor' with: [
				spec repository: 'github://feenkcom/Brick/src' ];
			baseline: 'BrickHydra' with: [
				spec repository: 'github://feenkcom/Brick/src' ];
			baseline: 'BrickMaterial' with: [
				spec repository: 'github://feenkcom/Brick/src' ];
			baseline: 'BrickGlamorous' with: [
				spec repository: 'github://feenkcom/Brick/src' ].

		spec 
			package: #'Brick-Editor-Examples' with: [
				spec requires: #(
					"#'PharoBootstrap'"
					
					#'BlocCore'
					#'BlocText'
					
					#'BlocPacInfinite'
					
					#'BrickWidgets'
					#'BrickEditor' ) ];
			package: #'Brick-Examples' with: [
				spec requires: #(
					"#'PharoBootstrap'"
					
					#'BlocCore'
					#'BlocAnimation'
					#'BlocLayout'
					#'BlocText'
					
					#'BlocPacAsyncElementExamples'
					#'BlocPacInfinite'
					#'BlocPacPullAndSlide'
					#'BlocPacScripter'
					
					#'BrickCore'
					#'BrickWidgets'
					#'BrickEditor'
					#'BrickHydra'
					#'BrickMaterial'
					#'BrickGlamorous' ) ] ].
]
