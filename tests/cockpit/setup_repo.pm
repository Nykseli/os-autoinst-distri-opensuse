
use Mojo::Base 'consoletest';
use testapi;
use package_utils 'install_package';
use serial_terminal 'select_serial_terminal';
use utils qw(clear_console zypper_call);
use CockpitTest;

sub run {
    my $test = CockpitTest->new();
    $test->test_start(1);

    assert_script_run "git clone $test->{repo_url}";
    assert_script_run "cd $test->{project_name}";
    assert_script_run "git fetch --tags";
    assert_script_run "git checkout $test->{repo_branch}";

    $test->test_end();
}

sub test_flags {
    return {fatal => 1};
}

1;
