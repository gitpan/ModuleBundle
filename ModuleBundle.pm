# -* - perl -*-

package ModuleBundle;
no strict 'refs';
# $Verbose = 1;
$VERSION = 0.01;
my %BAD;
@BAD{qw(import ISA BEGIN)} = ();
my $me = 'ModuleBundle';

sub import {
  my $pack = shift;
  return if $pack eq $me;
  my $dest;
  { my $uplevel = 2;
    for (;;) {
      last if ($dest = caller($uplevel)) ne $pack;
    }
  }
  print STDERR "$me: Installing $pack into $dest\n" if $Verbose;
  my ($n, $g);
  while (($n, $g) = each %{$pack . '::'}) {
    next if exists $BAD{$n};
    print STDERR "$me: $n\n" if $Verbose;
    *{$dest . "::$n"} = $g;
  }
}

1;


=head1 
NAME

ModuleBundle - Combine several other modules into one package
 
=head1 
SYNOPSIS

Create a package that looks like this:

	package XYZ;
	use X;
	use Y;
	use Z;
	use ModuleBundle;
	@ISA = 'ModuleBundle;
	1;

Now if you say

	use XYZ;

that is the same as saying

	use X;
	use Y;
	use Z;

=head1 DESCRIPTION

See the SYNOPSIS.

=head1 AUTHOR

Mark-Jason Dominus (mjd-perl-bundle@plover.com)

=cut

