# nodupes
Utility to crawl large mp3 collections and prompt for the removal of duplicates by title, size, and location


If you have a large mp3 music collection ( > 1,000) you will inevitably
discover that duplicate files have found its way into your device's playlist,
and now makes listening to an artist's album can be painful with all of the
false positives.

This utility may help.

It will not completely solve your duplicate mp3 files troubles, but it is a
very big start.  To date, there are no known utilities, CLI or GUI, that will
track duplicates by their mp3 tag, not their filename.

Filenames can vary, but its tag.title almost does not.




Nodupes is a script the will run through a directory of mp3 files and match all
titles that are identical. It will then prompt for action-- yea or nay.


So far, the regex involved doesn't mind spaces, apostrophes, brackets, or
parenthesis while processing.  However the script does have issues with
slashes.


Operation is very much hands-on: You must visually identify from CLI output
certain aspects of the duplicates found in order to determine which duplicate
to either ignore or delete.

A lot of the manual eye-balling depends on what's in your mp3 wallet, so to
speak.

Such as if you had the impulse, as I did, to import a huge collection of "Top
Billboards by Year" not realizing that the result would be duplicates of quite
a few of your original files...


Installing and running the nodupes script:


    git clone https://github.com/kharmajbird/nodupes.git

    cd nodupes
    cp -a nodupes.py /usr/local/bin

    python3 -m venv venv && source venv/bin/activate
    python3 -m pip install tinytag

    edit $FILT in nodupes.sh to either start fresh or pisk up where left off

./nodupes.sh [ /path/to/mp3s ]


======================

Script behavior

======================

Nodupes will ignore any regex parsing errors that might be thrown.

When chosing which duplicates to eliminate, I look at the file sizes of the
duplicate, any artist names, and known directories that seriously questionable,

It is OK to rerun the script. If you do, modify the FILT variable to
resume the last run and save time by skipping files you have already seen.



======================

Sample output and analysis:
use widescreen

======================

Found dupe I'm Still In Love With You


-rwxr-xr-x 1 root root 3106310 Jan  5  2002 "/j/NINETYEIGHT/EC-Bootleg/Al Green/Green, Al - I'm Still In Love With You.mp3"
-rwxr-xr-x 1 root root 4633365 Sep 13  2010 /j/NINETYEIGHT/EC-SoundsOfThe70s-BestOf/AlGreen/ImStillInLoveWithYou.mp3
-rwxr-xr-x 1 root root 5592155 Nov  4  2005 "/j/NINETYEIGHT/EC-TopBillboardByYear-1942-2007/1997/1997-044 New Edition - I'm Still In Love With You.mp3"
-rwxr-xr-x 1 root root 6549310 Nov  6  2005 "/j/NINETYEIGHT/EC-TopBillboardByYear-1942-2007/2004/2004-060 Sean Paul Featuring Sasha - I'm Still In Love With You.mp3"

-rwxr-xr-x 1 root root 3106310 Jan  5  2002 "/j/NINETYEIGHT/EC-Bootleg/Al Green/Green, Al - I'm Still In Love With You.mp3"

Do you wish to remove this duplicate: (N/y): y


Removing =/j/NINETYEIGHT/EC-Bootleg/Al Green/Green, Al - I'm Still In Love With You.mp3=


-rwxr-xr-x 1 root root 4633365 Sep 13  2010 /j/NINETYEIGHT/EC-SoundsOfThe70s-BestOf/AlGreen/ImStillInLoveWithYou.mp3

Do you wish to remove this duplicate: (N/y): 


-rwxr-xr-x 1 root root 5592155 Nov  4  2005 "/j/NINETYEIGHT/EC-TopBillboardByYear-1942-2007/1997/1997-044 New Edition - I'm Still In Love With You.mp3"

Do you wish to remove this duplicate: (N/y): 


-rwxr-xr-x 1 root root 6549310 Nov  6  2005 "/j/NINETYEIGHT/EC-TopBillboardByYear-1942-2007/2004/2004-060 Sean Paul Featuring Sasha - I'm Still In Love With You.mp3"

Do you wish to remove this duplicate: (N/y): 



Found dupe I'm Still Standing


-rwxr-xr-x 1 root root 4459878 Aug 26  2014 "/j/NINETYEIGHT/Nexus10-SD-Music/Elton John - Greatest Hits 1970 - 2002/CD2/02 Elton John - I'm Still Standing.mp3"
-rwxr-xr-x 1 root root 3695616 Nov  4  2005 "/j/NINETYEIGHT/EC-TopBillboardByYear-1942-2007/1983/074 - Elton John - I'm Still Standing.mp3"

-rwxr-xr-x 1 root root 4459878 Aug 26  2014 "/j/NINETYEIGHT/Nexus10-SD-Music/Elton John - Greatest Hits 1970 - 2002/CD2/02 Elton John - I'm Still Standing.mp3"

Do you wish to remove this duplicate: (N/y):

