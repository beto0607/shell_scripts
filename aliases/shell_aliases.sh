#!/bin/zsh

export STUDIO_PATH="$HOME/Studio";

# NPM/NODE
alias kill_npm="kill \$(ps aux | grep 'node' | awk '{print $1}')"
alias lint="npm run lint"

# STUDIO
# -- app 
alias studio_start_dev="cd $STUDIO_PATH; npx nx run studio:serve:remote"
alias studio_build_scripts="cd $STUDIO_PATH; npm run build:scripts -- --watch"
# -- acg
alias acg_start_dev="cd $STUDIO_PATH; npx nx run acg:serve:development"
# -- test
alias npm_test_ng="npm run test:ng -- --watch --silent=false"

# VS-CODE
alias code.="code ."
alias code_studio="code $STUDIO_PATH"


alias :q="exit"
alias :qa="exit"

