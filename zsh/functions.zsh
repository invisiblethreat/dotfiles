function urlencode() {
  perl -p -e 's/([^A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg'
}

function research() {
  mkdir -p $1/{inputs,outputs,go,r,python}
  touch $1/go/research.go
  touch $1/r/research.r
  touch $1/python/research.py

  printf "# $1\n\n" > $1/README.md
}

function xray() {
  dest=$(curl -skiI $1 | grep Location:|perl -lane 'print $F[1]')
  echo "$1 redirects to $dest"
}

function title() {
    echo -ne "\033]0;"$*"\007"
}

function make_venv() {
  python3 -m venv venv-$1
}

function venv() {
  if [ ! -z $VIRTUAL_ENV_PROMPT ]; then
    echo "Deactivating $VIRTUAL_ENV_PROMPT"
    deactivate
  else
    NAME="venv-$(basename $(pwd))"
    if [ -d $NAME ]; then
      echo "Entering venv: ($NAME)"
      source $NAME/bin/activate
    else
      make_venv $(basename $(pwd))
    fi
  fi

}
