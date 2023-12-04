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


function venv() {
  NAME="venv-$(basename $(pwd))"

  # deavtivate before deleting
  if [[ "$1" == "rm" && -d  $NAME  && ! -z $VIRTUAL_ENV_PROMPT ]]; then
    echo "Deactivating $VIRTUAL_ENV_PROMPT before deleting"
    deactivate
  fi

  # delete
  if [[ "$1" == "rm" && -d  $NAME  && -z $VIRTUAL_ENV_PROMPT ]]; then
    echo "Deleting $NAME"
    rm -rf $NAME
    return
  fi

  # if we're in a venv, deativate it
  if [ ! -z $VIRTUAL_ENV_PROMPT ]; then
    echo "Deactivating $VIRTUAL_ENV_PROMPT"
    deactivate
  else
    # if a venv exists enter it
    if [ -d $NAME ]; then
      echo "Entering venv: ($NAME)"
      source $NAME/bin/activate
    else
      # make a venv and enter it if it doesn't exist
      echo "Making venv ($NAME)"
      python3 -m venv $NAME
      echo "Entering venv: ($NAME)"
      source $NAME/bin/activate
      echo "Upgrading pip"
      pip3 install --upgrade pip


      # if requiements.txt exists install the packages listed
      if [ -f "requirements.txt" ]; then
        echo "Installing packages from requirements.txt into ($NAME)"
        pip3 install -r requirements.txt
      fi
    fi
  fi

}
