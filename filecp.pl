#!/usr/bin/perl
#filecp.pl - copy contents of a file without cp
#20140707 - Initial version - Mark Vovchuk

use Cwd;

my $infile = $ARGV[0];
my $outfile = $ARGV[1];

if ($outfile =~ m#/#)
{
    @dirs = split(m#/#,$file);
    $file = pop(@dirs);
    $path = join("/",@dirs);
}
else
{
    $path = cwd();
}

$fulloutfile = $path."/".$file;

if ( -r $infile )
{
    $validinfile = 1;
}
if ( -w $path )
{
    $validpath = 1;
}


if (( $validinfile ne 1) || ($validpath ne 1))
{
    print "$infile or $path may not be writable. Please check permissions and try again. Exiting\n";
    exit (1);
}

open (IN, "$infile");
open (OUT, ">$outfile");
while ($line = <IN>)
{
    print OUT "$line";
}
close (OUT);
close (IN);
