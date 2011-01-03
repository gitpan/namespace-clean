
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Keep imports and functions out of your namespace',
  'AUTHOR' => 'Robert \'phaylon\' Sedlacek <rs@474.at>, Florian Ragwitz <rafl@debian.org>, Jesse Luehrs <doy@tozt.net>',
  'BUILD_REQUIRES' => {
    'Exporter' => '0',
    'FindBin' => '0',
    'Test::More' => '0.88',
    'constant' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'namespace-clean',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'namespace::clean',
  'PREREQ_PM' => {
    'B::Hooks::EndOfScope' => '0.07',
    'Package::Stash' => '0.18',
    'Sub::Identify' => '0.04',
    'Sub::Name' => '0.04',
    'vars' => '0'
  },
  'VERSION' => '0.19',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



