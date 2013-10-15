# Public: Install gcc via homebrew
#
# Examples
#
#   include gcc
class gcc {

  case $::operatingsystem {
    'Darwin': {
      include homebrew

      ensure_resource('homebrew::tap', 'homebrew/versions', { 'ensure' => 'present' })

      package { 'homebrew/versions/gcc48':
        require => Homebrew::Tap['homebrew/versions']
      }
    }

    default: {
      package { 'gcc': }
    }
  }

}
