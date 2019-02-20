
use JSON::Name;
use JSON::Class;
class License::SPDX does JSON::Class {
    class License does JSON::Class {
        has Str     $.name;
        has Bool    $.is-deprecated-license-id  is json-name('isDeprecatedLicenseId');
        has Bool    $.is-osi-approved           is json-name('isOsiApproved');
        has Str     $.license-id                is json-name('licenseId');
        has Str     $.reference;
        has Str     $.details-url               is json-name('detailsUrl');
        has Str     @.see-also                  is json-name('seeAlso');
        has Str     $.reference-snumber         is json-name('referenceNumber');
        has Bool    $.is-fsf-libre              is json-name('isFsfLibre');
    }
    has Str     $.license-list-version  is json-name('licenseListVersion');
    has Str     $.release-date          is json-name('releaseDate');
    has License @.licenses;
}

# vim: ft=perl6
