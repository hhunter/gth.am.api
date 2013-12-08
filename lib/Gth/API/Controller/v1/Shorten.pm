package Gth::API::Controller::v1::Shorten;

use strict;
use warnings;
use parent 'Gth::API::Service';

use Gth::ShortURL;

sub shorten :Path :Args(0) {
  my $self = shift;
  my $c	   = shift;
  
  my $shortener = Gth::ShortURL->new();
  my $long_url  = $c->req->params->{longUrl};

  $long_url or $c->detach('error', ['must pass longUrl parameter to shorten']);

  my $short_url = $shortener->shorten($long_url)
    or $c->detach('error', [$Gth::ShortURL::error]);

  $c->stash->{data} = { shortUrl => $short_url };
}

1;
