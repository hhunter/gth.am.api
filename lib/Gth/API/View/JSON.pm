package Gth::API::View::JSON;

use strict;
use base 'Catalyst::View::JSON';

__PACKAGE__->config({
  allow_callback  => 1,    # defaults to 0
  callback_param  => 'callback', # defaults to 'callback'
  expose_stash    => 'data', # defaults to everything
});


1;
