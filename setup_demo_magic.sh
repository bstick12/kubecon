#!/bin/bash

function setup_demo_magic {

  DEMO_MAGIC=https://raw.githubusercontent.com/paxtonhare/demo-magic/master/demo-magic.sh

  DEMO_MAGIC_FILE=demo-magic.sh

  if [ ! -e ${DEMO_MAGIC_FILE} ]; then
    curl -sSL ${DEMO_MAGIC} > ${DEMO_MAGIC_FILE}
  fi

  source ${DEMO_MAGIC_FILE}

  TYPE_SPEED=50

  DEMO_PROMPT="${GREEN}➜ ${BLUE}\W${BROWN}$ "

}
