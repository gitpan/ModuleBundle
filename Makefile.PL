use ExtUtils::MakeMaker;
WriteMakefile(
	      NAME => 'ModuleBundle',
	      VERSION_FROM => 'ModuleBundle.pm',
#	      'linkext' => {LINKTYPE => ''},
	      'dist' => {COMPRESS => 'gzip', SUFFIX => 'gz'},
);
