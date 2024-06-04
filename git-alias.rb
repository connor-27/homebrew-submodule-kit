class GitAlias < Formula
  desc "Custom git aliases for submodule management"
  homepage "https://github.com/connor-27/homebrew-submodule-kit"
  url "https://github.com/connor-27/homebrew-submodule-kit/raw/main/git-alias.sh"
  version "1.0.0"
  # shasum -a 256 git-alias.sh
  sha256 "4eda45cae6be977ed6b959709ee2255b43a14df31a81ce79b2333b4afeb31d52"  # 쉘에 대한 해시값 넣기

  def install
    bin.install "git-alias.sh" => "git-alias"
    (bin/"git-alias-set").write <<~EOS
      #!/bin/bash
      git config --global alias.sub-help '!sh #{opt_bin}/git-alias help'
      git config --global alias.sub-clone '!sh #{opt_bin}/git-alias sub_clone'
      git config --global alias.sub-branch '!sh #{opt_bin}/git-alias sub_branch'
      git config --global alias.sub-checkout '!sh #{opt_bin}/git-alias sub_checkout'
      git config --global alias.sub-update '!sh #{opt_bin}/git-alias sub_update'
      git config --global alias.hists '!sh #{opt_bin}/git-alias git_hists'
      git config --global alias.hist '!sh #{opt_bin}/git-alias git_hist'
      git config --global alias.br '!sh #{opt_bin}/git-alias git_br'
      echo "Git aliases have been successfully configured."
    EOS
    chmod 0755, bin/"git-alias-set"
  end

  def caveats
    <<~EOS
      To configure git aliases, run:
        git-alias-set
    EOS
  end

  test do
    system "#{bin}/git-alias", "help"
  end
end
