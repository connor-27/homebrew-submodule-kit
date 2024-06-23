class Fgit < Formula
  desc "Custom git aliases for submodule management"
  homepage "https://github.com/connor-27/homebrew-submodule-kit"
  url "https://github.com/connor-27/homebrew-submodule-kit/raw/main/fgit.sh"
  # shasum -a 256 fgit.sh
  sha256 "80a6535f47ad25203860cf207558a20e486794e471d6b5712f56b05d66c6b002" # 쉘에 대한 해시값 넣기
  version "1.1.0"

  def install
    bin.install "fgit.sh" => "fgit"
  end

  test do
    system "#{bin}/fgit", "help"
  end
end