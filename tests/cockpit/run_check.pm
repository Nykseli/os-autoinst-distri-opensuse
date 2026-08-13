
use Mojo::Base 'consoletest';
use testapi;
use package_utils 'install_package';
use serial_terminal 'select_serial_terminal';
use utils qw(clear_console zypper_call);

sub run {
    # Cockpit tests don't want to run as root
    select_serial_terminal(0);

    # TODO: cd via the Cockpit class
    assert_script_run 'cd /var/tmp/cockpit-test-suite/starter-kit';

    # TODO: get the os from env / cockpit class
    assert_script_run 'export TEST_OS=opensuse-tumbleweed';
    assert_script_run 'echo $TEST_OS';
    # 15 minute timeout should be plenty for single test
    assert_script_run('make check', timeout => 1800);

    assert_script_run 'cd -';
}

sub test_flags {
    return {fatal => 1};
}

1;
