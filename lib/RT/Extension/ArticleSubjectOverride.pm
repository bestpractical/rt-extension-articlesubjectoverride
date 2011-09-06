use strict;
use warnings;
package RT::Extension::ArticleSubjectOverride;

our $VERSION = '0.01';

=head1 NAME

RT-Extension-ArticleSubjectOverride - Override Subject when selecting an Article

=head1 INSTALLATION 

=over

=item perl Makefile.PL

=item make

=item make install

May need root permissions

=item Edit your /opt/rt4/etc/RT_SiteConfig.pm

Add this line:

    Set(@Plugins, qw(RT::Extension::ArticleSubjectOverride));

or add C<RT::Extension::ArticleSubjectOverride> to your existing C<@Plugins> line.

By default, this will only be available on ticket Update with the normal Articles UI.
If you'd like to use it on Create, you'll need to enable the config option for Articles
on Create.

=item Clear your mason cache

    rm -rf /opt/rt4/var/mason_data/obj

=item Restart your webserver

=back

=head1 AUTHOR

Kevin Falcone <falcone@bestpractical.com>

=head1 BUGS

All bugs should be reported via
L<http://rt.cpan.org/Public/Dist/Display.html?Name=RT-Extension-ArticleSubjectOverride>
or L<bug-RT-Extension-ArticleSubjectOverride@rt.cpan.org>.


=head1 LICENCE AND COPYRIGHT

This software is Copyright (c) 2011 by Best Practical Solutions.

This is free software, licensed under:

  The GNU General Public License, Version 2, June 1991


=cut

package RT::Class;

sub SubjectOverride {
    my $self = shift;
    my $override = $self->FirstAttribute('SubjectOverride');
    return $override ? $override->Content : 0;
}

sub SetSubjectOverride {
    my $self = shift;
    my $override = shift;

    if ( $override == $self->SubjectOverride ) {
        return (0, "SubjectOverride is already set to that");
    }

    my $cf = RT::CustomField->new($self->CurrentUser);
    $cf->Load($override);

    if ( $override ) {
        my ($ok, $msg) = $self->SetAttribute( Name => 'SubjectOverride', Content => $override );
        return ($ok, $ok ? $self->loc('Added Subject Override: [_1]', $cf->Name) :
                           $self->loc('Unable to add Subject Override: [_1] [_2]', $cf->Name, $msg));
    } else {
        my ($ok, $msg) = $self->DeleteAttribute('SubjectOverride');
        return ($ok, $ok ? $self->loc('Removed Subject Override') :
                           $self->loc('Unable to add Subject Override: [_1] [_2]', $cf->Name, $msg));
    }
}

1;
