#!/usr/bin/perl -w

use lib qw[
  /home/hhunter/local/lib/perl5
  /home/hhunter/local/share/perl/5.8.8
  /home/hhunter/local/lib/perl/5.8.8
  /home/hhunter/local/share/perl/5.8.4
  /home/hhunter/local/lib/perl/5.8.4
  /home/hhunter/local/lib

  /home/hhunter/gth.am/catalyst/lib
];

BEGIN { $ENV{CATALYST_ENGINE} ||= 'FastCGI' }

use strict;
use warnings;
use Getopt::Long;
use Pod::Usage;
use FindBin;
use lib "$FindBin::Bin/../lib";
use Gth::API;

my $help = 0;
my ( $listen, $nproc, $pidfile, $manager, $detach, $keep_stderr );
 
GetOptions(
    'help|?'      => \$help,
    'listen|l=s'  => \$listen,
    'nproc|n=i'   => \$nproc,
    'pidfile|p=s' => \$pidfile,
    'manager|M=s' => \$manager,
    'daemon|d'    => \$detach,
    'keeperr|e'   => \$keep_stderr,
);

pod2usage(1) if $help;

Gth::API->run( 
    $listen, 
    {   nproc   => $nproc,
        pidfile => $pidfile, 
        manager => $manager,
        detach  => $detach,
	keep_stderr => $keep_stderr,
    }
);

1;

=head1 NAME

gth_api_fastcgi.pl - Catalyst FastCGI

=head1 SYNOPSIS

gth_api_fastcgi.pl [options]
 
 Options:
   -? -help      display this help and exits
   -l -listen    Socket path to listen on
                 (defaults to standard input)
                 can be HOST:PORT, :PORT or a
                 filesystem path
   -n -nproc     specify number of processes to keep
                 to serve requests (defaults to 1,
                 requires -listen)
   -p -pidfile   specify filename for pid file
                 (requires -listen)
   -d -daemon    daemonize (requires -listen)
   -M -manager   specify alternate process manager
                 (FCGI::ProcManager sub-class)
                 or empty string to disable
   -e -keeperr   send error messages to STDOUT, not
                 to the webserver

=head1 DESCRIPTION

Run a Catalyst application as fastcgi.

=head1 AUTHORS

Catalyst Contributors, see Catalyst.pm

=head1 COPYRIGHT

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
