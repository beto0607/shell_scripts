#!/bin/zsh

export STUDIO_PATH="$HOME/Studio";
export COMPOSEINFRA_PATH="$HOME/ComposeInfra";


#alias vim="nvim"
# NPM/NODE
alias kill_npm="kill \$(ps aux | grep 'node' | awk '{print $1}')"
alias lint="npm run lint"

# STUDIO
# -- app 
alias studio_start_dev="cd $STUDIO_PATH; npx nx run studio:serve:remote-dev"
alias studio_build_scripts="cd $STUDIO_PATH; npm run build:scripts -- --watch"
# -- acg
alias acg_start_dev="cd $STUDIO_PATH; npx nx run acg:serve:development"
# -- test
alias npm_test_ng="npm run test:ng -- --watch --silent=false"

# ComposeInfra
alias gateway_up="cd $COMPOSEINFRA_PATH; docker compose up -d gateway; cd -"
alias storage_emulator_up="cd $COMPOSEINFRA_PATH; docker compose up -d storage-emulator; cd -"

# VS-CODE
alias code.="code ."
alias code_studio="code $STUDIO_PATH"


alias :q="exit"
alias :qa="exit"

