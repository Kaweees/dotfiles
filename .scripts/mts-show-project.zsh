#!/usr/bin/zsh
project="$1"

project=$(\
  echo "$project" |\
    sed --regexp-extended "s/^.{1,2} (\S+)\//projects\/\1\//g" |\
    \
    sed --regexp-extended "s/^🟢 /projects\/personal\//g" |\
    sed --regexp-extended "s/^.{1,2}  forks/forks/g" |\
    sed --regexp-extended "s/^.{1,2}  study/study/g" |\
    tee \
)

list_files() {
  export EXA_COLORS="di=33"
  /usr/bin/eza -1 --icons -T -L 3 --git-ignore \
  --group-directories-first -l --no-permissions \
  --no-user --no-filesize --changed --no-time $HOME/"$project"
}

print_repo_data() {
  clear
  projectname=$(basename "$project")
  commitcount=$(git --git-dir=$gitdir \
                rev-list --all --count)

  printf "\e[0;93m󰆥\e[1;34m $projectname \e[0m\n"

  printf "\e[0;93m\e[0;34m branch\e[0m   "

  git --git-dir=$gitdir \
  rev-parse --abbrev-ref HEAD

  printf "\e[0;93m󰆥\e[0;34m commits\e[0m  "
  echo $commitcount

  echo

  list_files
}


gitdir="$(echo "$HOME/")$(echo "$project")$(echo "/.git")"

if [ -d $gitdir ]; then
  onefetch_plain_output=$(\
    onefetch\
      --no-art\
      --no-title\
      ~/"$project"\
      --true-color never\
    ||\
    print_repo_data\
  )
  echo "$onefetch_plain_output"
else
  list_files
fi
