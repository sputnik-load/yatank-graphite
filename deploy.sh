#!/bin/bash

OLD_PATH=$(pwd)
cd $(dirname $0)

PACKAGE_NAME=$(cat setup.py | grep -o "name=['\"]\(\w\|-\|_\)*['\"]" | sed "s/name=['\"]\(.*\)['\"]/\1/")
PREFIX_PATH=$1
PACKAGES_DIR=$PREFIX_PATH/packages
PY_HOST=$2
PY_PORT=$3
INDEX_URL=http://$PY_HOST:$PY_PORT/simple/

source /data/qa/ltbot/venv/bin/activate

pip uninstall --yes $PACKAGE_NAME
python setup.py sdist
rm -rf ./*.egg-info
cp dist/$PACKAGE_NAME* $PACKAGES_DIR

if [[ $# -eq 1 ]]
then
	PACKAGE_NAME="$PACKAGE_NAME==$1"
fi
pip install --index-url=$INDEX_URL $PACKAGE_NAME --trusted-host=$PY_HOST --no-cache-dir
rm -rf ./dist
cd $OLD_PATH
