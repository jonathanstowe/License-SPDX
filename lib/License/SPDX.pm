
use v6;

use JSON::Name;
use JSON::Class;
class License::SPDX does JSON::Class {
    class License does JSON::Class {
        has Str     $.name;
        has Bool    $.is-deprecated-license     is json-name('isDeprecatedLicenseId');
        has Bool    $.is-osi-approved           is json-name('isOsiApproved');
        has Str     $.license-id                is json-name('licenseId');
        has Str     $.reference;
        has Str     $.details-url               is json-name('detailsUrl');
        has Str     @.see-also                  is json-name('seeAlso');
        has Str     $.reference-snumber         is json-name('referenceNumber');
        has Bool    $.is-fsf-libre              is json-name('isFsfLibre');
    }
    has Str     $.license-list-version  is json-name('licenseListVersion');
    has Date     $.release-date          is json-name('releaseDate') is unmarshalled-by( -> $d { Date.new($d) });
    has License @.licenses;

    has License %.license-by-id         is json-skip;

    method license-by-id( --> Hash ) {
        %!license-by-id ||= @!licenses.map(-> $l { $l.license-id => $l }).Hash;
    }

    method get-license( Str:D $id --> License ) {
        self.license-by-id{$id} || License;
    }

    has Str @.license-ids               is json-skip;

    method license-ids( --> Array ) {
        @!license-ids ||= self.license-by-id.keys.Array;
    }

    multi method new(*%v where { not $_.keys }) {
        self.from-json(%?RESOURCES<data/licenses.json>.slurp);
    }
}

# vim: ft=perl6
