use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'Gth::API' }
BEGIN { use_ok 'Gth::API::Controller::v1::Lengthen' }

ok( request('/v1/lengthen')->is_success, 'Request should succeed' );


