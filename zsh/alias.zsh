# Git
alias gd="git diff @~..@"
alias grs="git reset HEAD~1"
alias gst="git status -s"
alias gsta="git add -A; git stash"
alias gl="git log --oneline --decorate --color"
alias ga="git add"
alias gad="git add ."

gcmap() {
  git commit --amend;
  branch_name=$(git symbolic-ref --short -q HEAD);
  git push origin $branch_name -f;
}

d.() {
  curr_branch=$(git symbolic-ref --short -q HEAD);
  git checkout develop;
  git br -D $curr_branch;
}

gpl() {
  curr_branch=$(git symbolic-ref --short -q HEAD);
  git pull upstream $curr_branch;
  run_migrate;
}

gph() {
  git add -A;
  git commit -m $1;
  branch_name=$(git symbolic-ref --short -q HEAD);
  if gd | grep "binding.pry"
  then
    echo "Binding pry detected!"
    return 0
  fi
  git push origin $branch_name;
  repo_url=$(git config --get remote.origin.url)
  repo_name=(${=repo_url//:/ })    # Zsh split string to arr T.T
  google-chrome "https://github.com/${repo_name[2]}"
  if [ "$(uname)" == "Darwin" ]; then
    open -a /Applications/Google\ Chrome.app/ -g $repo_url
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    google-chrome "https://github.com/${repo_name[1]}"
  elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
      # Do something under Windows NT platform
  fi
}

gphf() {
  git add -A;
  git commit --amend;
  branch_name=$(git symbolic-ref --short -q HEAD);
  if gd | grep "binding.pry"
  then
    echo "Binding pry detected!"
    return 0
  fi
  git push origin $branch_name -f;
}

grb() {
  curr_branch=$(git symbolic-ref --short -q HEAD);
  git checkout $1;
  git pull upstream $1;
  git checkout $curr_branch;
  git rebase $1;
}

grc() {
  git add .;
  git rebase --continue;
  branch_name=$(git symbolic-ref --short -q HEAD);
  git push origin $branch_name -f;
}

gct() {
  git checkout master;
  git checkout -b $1;
}

gcmp() {
  git commit -m $1;
  branch_name=$(git symbolic-ref --short -q HEAD);
  git push origin $branch_name;
}

# Rails
# run_migrate() {
#   if rake db:migrate:status | grep down
#   then
#     rake db:migrate
#     return 0;
#   fi
# }

# Recheck before upload code to github
# recheck() {
#   echo "Run Rubocop"
#   echo "=========================================================================================="
#   bundle exec rubocop --require rubocop/formatter/checkstyle_formatter --rails app/
#   echo "=========================================================================================="
#   echo "Run Rspec test"
#   echo "=========================================================================================="
#   rspec spec/
#   echo "=========================================================================================="
#   echo "Run Brakeman"
#   bundle exec brakeman
# }

# System
alias pls="sudo"
alias rr="rm -rf"
alias q="exit"
alias c="clear"

alias kill="sudo killall -9"

# ls
alias ll="ls -lah"
alias la="ls -A"
alias l="ls"

# File system tree
alias .='pwd'
alias ..='cd ..'
alias ...='cd ../..'
