
use Mojo::Base 'consoletest';
use testapi;
use package_utils 'install_package';
use serial_terminal 'select_serial_terminal';
use utils qw(clear_console zypper_call);
use CockpitTest;

sub run {
    my $test = CockpitTest->new();
    $test->test_start(1);

    assert_script_run "git clone --depth=1 $test->{repo_url}";
    assert_script_run "cd $test->{project_name}";
    # 15 minute timeout should be plenty of time for all the npm shenanigans
    assert_script_run('make', timeout => 1800);

    $test->test_end();
}

sub test_flags {
    return {fatal => 1};
}

1;
