#!/bin/bash

dir=$(dirname $0)

SHELL=${SHELL##*/}
RCFILE=${HOME}/.${SHELL}rc

\cp ${dir}/.gdbinit ${HOME}/.gdbinit
\cp ${dir}/.vimrc ${HOME}/.vimrc
\cp -r ${dir}/.vim ${HOME}/.vim
\cp -r ${dir}/.shellenv ${HOME}/.shellenv

if [[ $OSTYPE =~ "darwin" ]];then
    # the bad mac shell ...
    sed -i '' '/##DEVENV-ABCABCABC##/d' ${RCFILE}
else
    sed -i '/##DEVENV-ABCABCABC##/d' ${RCFILE}
fi
echo 'for f in ${HOME}/.shellenv/*;do if [ -x $f ];then . $f;fi;done ##DEVENV-ABCABCABC##' >> ${RCFILE}

. ${RCFILE}

