package Gth::API::Service;

use strict;
use warnings;
use parent 'Catalyst::Controller';

use JSON;

sub auto :Private {
  my $self = shift;
  my $c    = shift;

}

sub error :Private {
  my $self = shift;
  my $c    = shift;

  my $err  = shift;
  $err and $c->stash->{error} = $err;
}

sub return_data :Private {
  my $self = shift;
  my $c    = shift;

  # detach to this method and return early
}

sub _check_args_exist :Private {
  my $self = shift;
  my $c    = shift;

  my @args_to_test = @_;

  @args_to_test = map { 
    exists $c->req->params->{$_} or $c->detach('error', ["Missing $_"]);
    $c->req->params->{$_} 
  } @args_to_test;

  return \@args_to_test;
}

sub end :Private {
  my $self = shift;
  my $c    = shift;

  #$c->stash->{error} ||= undef;
  $c->stash->{data}  ||= undef;

  if (defined $c->stash->{error}) {
    $c->stash->{data} = {
      error => $c->stash->{error}
    };
  }

  my $format = lc $c->req->params->{format} || 'json';
  
  if ($format eq 'json') {
    $c->forward($c->view("JSON"));
  } elsif ($format eq 'text') {
    $c->res->body(to_json($c->stash->{data}));
  }
}

=head1 AUTHOR

Hugh Hunter

=cut

1;

