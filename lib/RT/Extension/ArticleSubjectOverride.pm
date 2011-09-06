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

1;
