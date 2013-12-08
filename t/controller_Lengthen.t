use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'Gth::API' }
BEGIN { use_ok 'Gth::API::Controller::Lengthen' }

ok( request('/lengthen')->is_success, 'Request should succeed' );


