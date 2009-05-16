package Net::Twitter::Lite::API;

use Moose::Role;

requires qw/definition base_url/;


sub method_definitions {
    my ($class) = @_;

    return { map { $_->[0] => $_->[1] } map @{$_->[1]}, @{$class->definition} };
}

1;

__END__

=head1 NAME

Net::Twitter::Lite::API - A definition of the Twitter API in a perl data structure

=head1 SYNOPSIS

    use aliased 'Net::Twitter::Lite::API::REST';

    my $api_def = API->definition;

=head1 DESCRIPTION

B<Net::Twitter::Lite::API> is the base class for classes providing API
definitions. It is used by the Net::Twitter::Lite distribution to dynamically
build methods, documentation, and tests.

=head1 METHODS

=head2 base_url

Returns the base URL for the API.

=head2 definition_url

Returns the API definition in the following form:

    ArrayRef[Section];

where,

    Section is an ARRAY ref: [  SectionName, ArrayRef[Method] ];

where,

    SectionName is a string containing the name of the section;

and,

    Method is an ARRAY ref: [ MethodName, HashRef[MethodDefinition] ];

where,

    MethodName is a string containing the same of the Twitter API method;

and,

    MethodDefinion as a HASH ref: {
        description => Str,
        path        => Str,
        params      => ArrayRef[Str],
        required    => ArrayRef[Str],
        returns     => Str,
        deprecated  => Bool,
    }

where,

=over 4

=item description

A string containing text describing the Twitter API call suitable for use in
documentation.

=item path

A string containing the path for the Twitter API excluding the leading slash and
the C<.format> suffix.

=item params

An ARRAY ref of all documented parameter names, if any.  Otherwise, an empty ARRAY ref.

=item required

An ARRAY ref of all required parameters if any.  Otherwise, an empty ARRAY ref.

=item returns

A string is pseudo L<Moose::Util::TypeConstraint> syntax.  For example, a return type of
C<ArrayRef[Status]> is an ARRAY ref of status structures as defined by Twitter.

=item deprecated

A bool indicating the Twitter API method has been deprecated.  This can can be
omitted for non-deprecated methods.

=back

=head2 method_definitions

This method returns a HASH ref where the keys are method names and the values are individual
method definitions as described above for the API specified by the optional $api_name
argument.

=head1 SEE ALSO

=over 4

=item L<Net::Twitter::Lite>

Net::Twitter::Lite::API was written for the use of this module and its distribution.

=item L<http://apiwiki.twitter.com/>

The Twitter API documentation.

=back

=head1 AUTHOR

Marc Mims <marc@questright.com>

=head1 LICENSE

Copyright (c) 2009 Marc Mims

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.