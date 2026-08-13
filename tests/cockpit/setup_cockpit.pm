use Mojo::Base 'consoletest';
use testapi;
use package_utils 'install_package';
use serial_terminal 'select_serial_terminal';
use utils qw(clear_console zypper_call);

sub run {
    select_serial_terminal;

    install_package('gettext-runtime');
    install_package('nodejs-default');
    install_package('npm-default');
    install_package('make');
    install_package('git-core');
    install_package('jq');
    install_package('chromedriver');
    install_package('chromium');
    install_package('curl');
    install_package('diffstat');
    install_package('git-core');
    install_package('intltool');
    install_package('jq');
    install_package('libvirt-client');
    install_package('libvirt-daemon-driver-qemu');
    install_package('libvirt-daemon-driver-storage-core');
    install_package('python3-libvirt-python');
    install_package('python3-aiohttp');
    install_package('python3-aioresponses');
    install_package('python3-build');
    install_package('python3-flake8');
    install_package('python3-gssapi');
    install_package('python3-mypy');
    install_package('python3-mwclient');
    install_package('python3-openidc-client');
    install_package('python3-Pillow');
    install_package('python3-pip');
    install_package('python3-pytest');
    install_package('python3-pytest-cov');
    install_package('python3-vulture');
    install_package('python3-wheel');
    install_package('rpm-build');
    install_package('rpmdevtools');
    install_package('rsync');
    install_package('socat');
    install_package('strace');
    install_package('tar');
    install_package('virt-install');

}

sub test_flags {
    return {fatal => 1};
}

1;
