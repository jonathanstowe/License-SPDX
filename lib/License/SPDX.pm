
use JSON::Name;
use JSON::Class;
class License::SPDX does JSON::Class {
    class License does JSON::Class {
        has Str $.name;
        has Bool $.isDeprecatedLicenseId;
        has Bool $.isOsiApproved;
        has Str $.licenseId;
        has Str $.reference;
        has Str $.detailsUrl;
        has  @.seeAlso;
        has Str $.referenceNumber;
        has Bool $.isFsfLibre;
    }
    has Str $.licenseListVersion;
    has Str $.releaseDate;
    has License @.licenses;
}

# vim: ft=perl6
