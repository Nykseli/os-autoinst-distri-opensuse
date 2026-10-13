
use Mojo::Base 'consoletest';
use testapi;
use mmapi qw(get_current_job_id);
use package_utils 'install_package';
use serial_terminal 'select_serial_terminal';
use utils qw(clear_console zypper_call);
use CockpitTest;

sub run {
    my $test = CockpitTest->new();
    $test->test_start();

    my $ret = script_run("set -o pipefail; $test->{test_script} 2>&1 | tee /tmp/cockpit-tests.log", timeout => 7200);

    # We need to get the job id for downloading the logs later.
    # This is a hacky way to do it.
    my $job_id = get_current_job_id();
    assert_script_run("cp /home/$username/data/cockpit-test-ui.html /tmp/cockpit-test-ui-$job_id.html", timeout => 60);
    upload_asset "/tmp/cockpit-test-ui-$job_id.html", 1;
    upload_logs '/tmp/cockpit-tests.log';

    die("Cockpit test run timed out") unless defined $ret;
    die("Cockpit test run failed") unless $ret == 0;

    $test->test_end();
}

1;
