#!/usr/bin/perl -w
# fsa roll installation test.  Usage:
# fsa.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my @packages = ('amos', 'fsa', 'mummer');
my $output;
my $TESTFILE = 'tmpfsa';

# fsa-common.xml
foreach my $package(@packages) {
  if($appliance =~ /$installedOnAppliancesPattern/) {
    ok(-d "/opt/$package", "$package installed");
  } else {
    ok(! -d "/opt/$package", "$package not installed");
  }
}

# amos
my $packageHome = '/opt/amos';
my $testDir = "$packageHome/test/minimus/influenza-A";
SKIP : {
  skip 'amos not installed', 1 if ! -d $packageHome;
  skip 'amos test not installed', 1 if ! -d $testDir;
  open(OUT, ">${TESTFILE}amos.sh");
  print OUT <<END;
module load fsa
mkdir ${TESTFILE}amos.dir
cd ${TESTFILE}amos.dir
cp $testDir/influenza-A.afg .
$packageHome/bin/minimus influenza-A
diff $testDir/influenza-output.fasta influenza-A.fasta
if test \$? == 0; then
  echo PASSED
else
  echo FAILED
fi
END
  close(OUT);
  $output = `/bin/bash ${TESTFILE}amos.sh 2>&1`;
  ok($output =~ /PASSED/, 'amos sample run');
}

# fsa
$packageHome = '/opt/fsa';
$testDir = "$packageHome/examples";
SKIP : {
  skip 'fsa not installed', 1 if ! -d $packageHome;
  skip 'fsa test not installed', 1 if ! -d $testDir;
  open(OUT, ">${TESTFILE}fsa.sh");
  print OUT <<END;
module load fsa
mkdir ${TESTFILE}fsa.dir
cd ${TESTFILE}fsa.dir
fsaResult=PASSED
for F in `ls $testDir/*.fasta`; do
  fsa --noindel2 --refinement 0 \$F > x.mfa
  mfa=`echo \$F | sed 's/fasta/mfa/'`
  diff -B \$mfa x.mfa
  if test \$? != 0; then
    fsaResult=FAILED
  fi
done
echo \$fsaResult
END
  close(OUT);
  $output = `/bin/bash ${TESTFILE}fsa.sh 2>&1`;
  ok($output =~ /PASSED/, 'fsa sample run');
}

# mummer
$packageHome = '/opt/mummer';
$testDir = "$packageHome/test";
SKIP : {
  skip 'mummer not installed', 1 if ! -d $packageHome;
  skip 'mummer test not installed', 1 if ! -d $testDir;
  open(OUT, ">${TESTFILE}mummer.sh");
  print OUT <<END;
module load fsa
mkdir ${TESTFILE}mummer.dir
cd ${TESTFILE}mummer.dir
cp $testDir/*.fasta .
mummer -mum -b -c *.fasta
END
  close(OUT);
  $output = `/bin/bash ${TESTFILE}mummer.sh 2>&1`;
  ok($output =~ /243049\s+213455\s+197/, 'mummer sample run');
}

# modulefiles
SKIP: {

  skip 'fsa not installed', 3 if $appliance !~ /$installedOnAppliancesPattern/;
  `/bin/ls /opt/modulefiles/applications/fsa/[0-9]* 2>&1`;
  ok($? == 0, 'fsa module installed');
  `/bin/ls /opt/modulefiles/applications/fsa/.version.[0-9]* 2>&1`;
  ok($? == 0, 'fsa version module installed');
  ok(-l '/opt/modulefiles/applications/fsa/.version',
     'fsa version module link created');

}

`rm -fr $TESTFILE*`;
