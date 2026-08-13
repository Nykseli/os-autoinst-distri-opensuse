# TODO: docs and stuff

package CockpitTest;
use strict;
use testapi;
use serial_terminal 'select_serial_terminal';

sub new {
    my ($class) = @_;
    my $repo_url = get_required_var('COCKPIT_REPO_URL');
    my $repo_branch = get_var('COCKPIT_REPO_BRANCH', 'main');
    my $repo_os = get_var('COCKPIT_REPO_OS', 'opensuse-tumbleweed');
    my ($project_name) = $repo_url =~ /\/([A-z0-9-_]+)(?:\.git)?$/;
    die 'Project name could not be extracted from repository url' unless $project_name;

    my $self = {
        project_root => '/var/tmp/cockpit-test-suite',
        project_name => $project_name,
        repo_url => $repo_url,
        repo_branch => $repo_branch,
        repo_os => $repo_os,
    };
    # Bless the reference as an object of the class
    bless $self, $class;
    return $self;
}

sub test_start {
    my ($self, $is_init) = @_;

    # Cockpit tests don't want to run as root
    select_serial_terminal(0);

    assert_script_run "export TEST_OS=$self->{repo_os}";

    if ($is_init) {
        assert_script_run "mkdir $self->{project_root}";
        assert_script_run "cd $self->{project_root}";
    } else {
        assert_script_run "cd $self->{project_root}/$self->{project_name}";
    }
}

sub test_end {
    my ($self) = @_;
    assert_script_run "cd -";
}

1;
