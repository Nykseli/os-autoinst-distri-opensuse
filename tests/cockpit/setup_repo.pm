
use Mojo::Base 'consoletest';
use testapi;
use package_utils 'install_package';
use serial_terminal 'select_serial_terminal';
use utils qw(clear_console zypper_call);

sub run {
    # Cockpit tests don't want to run as root
    select_serial_terminal(0);
    # select_console('user-console') if (current_console() != 'user-console');

    assert_script_run 'mkdir /var/tmp/cockpit-test-suite';
    assert_script_run 'cd /var/tmp/cockpit-test-suite';

    # TODO: get the url from env
    assert_script_run 'git clone --depth=1 https://github.com/cockpit-project/starter-kit';
    assert_script_run 'cd starter-kit';
    # 15 minute timeout should be plenty of time for all the npm shenanigans
    assert_script_run('make', timeout => 1800);

    assert_script_run 'cd -';
}

sub test_flags {
    return {fatal => 1};
}

1;
