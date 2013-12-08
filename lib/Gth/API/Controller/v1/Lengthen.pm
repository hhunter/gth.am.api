package Gth::API::Controller::v1::Lengthen;

use strict;
use warnings;
use parent 'Gth::API::Service';

use Gth::ShortURL;

sub lengthen :Path :Args(0) {
  my $self = shift;
  my $c	   = shift;
  
  my $short_url = $c->req->params->{shortUrl};
 
  $short_url or $c->detach('error', ['must pass shortUrl parameter to lengthen']);
  
  my $shortener = Gth::ShortURL->new();
  my $long_url  = $shortener->lengthen($short_url)
    or $c->detach('error', [$Gth::ShortURL::error]);

  $c->stash->{data} = $long_url;
}

1;
