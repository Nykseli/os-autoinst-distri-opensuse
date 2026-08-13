
use Mojo::Base 'consoletest';
use testapi;
use package_utils 'install_package';
use serial_terminal 'select_serial_terminal';
use utils qw(clear_console zypper_call);
use CockpitTest;

sub run {
    my $test = CockpitTest->new();
    $test->test_start();

    assert_script_run('make vm', timeout => 1800);

    $test->test_end();
}

sub test_flags {
    return {fatal => 1};
}

1;
