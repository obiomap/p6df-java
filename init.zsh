p6df::modules::java::version() { echo "0.0.1" }
p6df::modules::java::deps()    { 
	ModuleDeps=()
}

p6df::modules::java::external::brew() {

  brew cask install $java_ver
  brew cask install $java_ver_dev
  brew cask install gradle
}

p6df::modules::java::init() {

  p6df::modules::java::jenv::init
}

p6df::modules::java::jenv::init() {
    [ -n "$DISABLE_ENVS" ] && return

    export JENV_ROOT=/Users/pgollucci/.local/share/gcuisinier/jenv
    p6dfz::util::path_if $JENV_ROOT/bin

    if [ -x $JENV_ROOT/bin/jenv ]; then
      export HAS_JAENV=1
      eval "$(jenv init - zsh)"
    fi
}

p6df::prompt::java::line() {

  env_version "j"
}

p6df::modules::java::init