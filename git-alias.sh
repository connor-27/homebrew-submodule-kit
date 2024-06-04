#!/bin/bash

#####################################################
# _______________________   ___________________________________
# __  ____/___  _/__  __/   ___    |__  /____  _/__    |_  ___/
# _  / __  __  / __  /      __  /| |_  /  __  / __  /| |____ \
# / /_/ / __/ /  _  /       _  ___ |  /____/ /  _  ___ |___/ /
# \____/  /___/  /_/        /_/  |_/_____/___/  /_/  |_/____/
#####################################################
# Help
#####################################################
# 함수에 대한 설명을 출력
function help() {
  echo "사용 가능한 명령어:"
  echo "  sub_clone <repo_url>   - 서브모듈이 있는 저장소를 클론하고 서브모듈을 main 브랜치로 체크아웃 후 최신 상태로 업데이트"
  echo "  sub_branch [submodule] - 서브모듈의 브랜치 정보를 조회"
  echo "  sub_checkout <branch> [submodule] - 서브모듈을 지정한 브랜치로 체크아웃하고 업데이트"
  echo "  sub_update [submodule] - 서브모듈을 최신 상태로 업데이트"
  echo "  git_hists              - git 로그 그래프를 모두 표시 (트리 보기)"
  echo "  git_hist               - git 로그 그래프 심플 버전"
}
#####################################################
# - sub_clone
# - sub_branch
# - sub_checkout
# - sub_update
# - git_hists
# - git_hist
#####################################################
# git submodule One Command
# 서브모듈이 있는 Working Repository 를 clone 하면서
# 서브모듈을 Detatched HEAD 상태가 아닌 main branch 상태로 변경하고
# main 브랜치의 최신상태로 Update (pull)
function sub_clone() {
  repo_url=$1

  git clone --recurse-submodules "$repo_url" &&
  repo_name=$(basename "$repo_url" .git) &&
  cd "$repo_name" &&
  submodule_name=$(awk '/path/ {print $3}' .gitmodules) &&
  echo "repo name = $repo_name submodule name = $submodule_name" &&
  cd "$submodule_name" &&
  git checkout main &&
  git pull &&
  cd .. &&
  git add .
}

#####################################################
# git submodule 의 브랜치 정보를 조회
function sub_branch() {
  submodule_name=${1:-$(awk '/path/ {print $3}' .gitmodules)}
  cd "$submodule_name" && git branch
}

#####################################################
# 서브모듈을 원하는 브랜치로 checkout
function sub_checkout() {
  submodule_name=${1:-$(awk '/path/ {print $3}' .gitmodules)}
  branch_name=$2
  if [ -z "$branch_name" ]; then
    echo '브랜치 이름을 제공해야 합니다.'
    exit 1
  fi
  cd "$submodule_name" &&
  git checkout "$branch_name" || (echo '해당 브랜치가 존재하지 않습니다.' && exit 1)
  git submodule update --remote
  cd .. && git add "$submodule_name"
}

#####################################################
# 서브모듈을 업데이트 한 후 git staged 상태로 변경 (add)
function sub_update() {
  submodule_name=${1:-$(awk '/path/ {print $3}' .gitmodules)}
  cd "$submodule_name" && git pull
  cd .. && git add "$submodule_name"
}

#####################################################
# git 그래프 모두 표시 (tree 보기)
function git_hists() {
  git log --oneline --graph --all --decorate
}

#####################################################
# git 그래프 심플 버전
function git_hist() {
  git log --oneline --graph
}

#####################################################
#####################################################
if [[ $1 == "sub_clone" ]]; then
  sub_clone "$2"
elif [[ $1 == "sub_branch" ]]; then
  sub_branch "$2"
elif [[ $1 == "sub_checkout" ]]; then
  sub_checkout "$2" "$3"
elif [[ $1 == "sub_update" ]]; then
  sub_update "$2"
elif [[ $1 == "git_hists" ]]; then
  git_hists
elif [[ $1 == "git_hist" ]]; then
  git_hist
elif [[ $1 == "git_br" ]]; then
  git_br
elif [[ $1 == "help" ]]; then
  help
else
  echo "정의되지 않은 명령어입니다: $1"
  help
  exit 1
fi

