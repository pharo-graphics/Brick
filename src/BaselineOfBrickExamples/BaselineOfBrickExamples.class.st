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
				self repository: 'github://feenkcom/Bloc/src' for: spec ];
			baseline: 'BlocAnimation' with: [
				self repository: 'github://feenkcom/Bloc/src' for: spec ];
			baseline: 'BlocLayout' with: [
				self repository: 'github://feenkcom/Bloc/src' for: spec ];
			baseline: 'BlocText' with: [
				self repository: 'github://feenkcom/Bloc/src' for: spec ];
			
			baseline: 'BlocPacAsyncElementExamples' with: [
				self repository: 'github://feenkcom/bloc-pac:main/src' for: spec ];
			baseline: 'BlocPacInfinite' with: [
				self repository: 'github://feenkcom/bloc-pac:main/src' for: spec ];
			baseline: 'BlocPacPullAndSlide' with: [
				self repository: 'github://feenkcom/bloc-pac:main/src' for: spec ];
			baseline: 'BlocPacScripter' with: [
				self repository: 'github://feenkcom/bloc-pac:main/src' for: spec ];
			

			baseline: 'BrickCore' with: [
				self thisRepositoryFor: spec ];
			baseline: 'BrickWidgets' with: [
				self thisRepositoryFor: spec ];
			baseline: 'BrickEditor' with: [
				self thisRepositoryFor: spec ];
			baseline: 'BrickHydra' with: [
				self thisRepositoryFor: spec ];
			baseline: 'BrickMaterial' with: [
				self thisRepositoryFor: spec ];
			baseline: 'BrickGlamorous' with: [
				self thisRepositoryFor: spec ].

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
