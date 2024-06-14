# submodule-kit

## 사용법

brew info fgit
brew update
brew upgrade --cask

```shell
brew tap connor-27/homebrew-submodule-kit
brew install fgit
```
일반적인 경우 위에 절차로 진행하면 이슈 없이 install 및 사용 가능

만약에 install 과정 중 에러 내용이 아래와 같다면
```shell
==> Installing fgit from connor-27/submodule-kit
Error: Your Command Line Tools are too outdated.
Update them from Software Update in System Settings.

If that doesn't show you any updates, run:
  sudo rm -rf /Library/Developer/CommandLineTools
  sudo xcode-select --install

Alternatively, manually download them from:
  https://developer.apple.com/download/all/.
You should download the Command Line Tools for Xcode 15.1.
```
**`xcode` 를 업데이트 해줘야 함**
-> 하지만 맥북에서의 `Xcode` 의 업데이트는 위험요소가 크기에...
이에 해당하는 사용자는 연락 부탁드립니다.

xcode 가 아닌  `Command Line Tools` 만 사용하는 유저의 경우
```shell
sudo rm -rf /Library/Developer/CommandLineTools
xcode-select --install
```
로 Command Line Tools 버전을 올릴 수 있음

-----

## 정상적인 설치가 안될 경우

```shell
brew uninstall fgit
brew untap connor-27/homebrew-submodule-kit
```

-----

## 버전 변경에 따른 재설치

```shell
brew info fgit
brew uninstall fgit
# 만약에 uninstall 이 잘 안될 경우~ 
# brew update
# brew upgrade --cask
# doctor 를 통해서 현재 brew 의 문제점들을 명령창에 나오는데로 해결해나감
# brew doctor 
brew info fgit
brew untap connor-27/homebrew-submodule-kit

# 재설치
brew tap connor-27/homebrew-submodule-kit
brew install fgit

```
----

## Uninstall 이 잘 안될 경우

### 1) 포뮬러 강제 삭제
```shell
rm -rf /usr/local/Cellar/fgit
rm -rf /opt/homebrew/Cellar/fgit
```

### 2) Tab 강제 삭제
```shell
rm -rf /usr/local/Homebrew/Library/Taps/connor-27/homebrew-submodule-kit
rm -rf /opt/homebrew/Library/Taps/connor-27/homebrew-submodule-kit
```

### 3) 캐싱 및 brew 잔재 재거 
```shell
brew cleanup
brew doctor
```

### 4) Tab 재설치
```shell
brew tap connor-27/homebrew-submodule-kit
brew install fgit
```
