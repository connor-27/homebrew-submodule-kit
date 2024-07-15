class Fgit < Formula
  desc "Custom git aliases for submodule management"
  homepage "https://github.com/connor-27/homebrew-submodule-kit"
  url "https://github.com/connor-27/homebrew-submodule-kit/raw/main/fgit.sh"
  # shasum -a 256 fgit.sh
  sha256 "e1e5fe375ce4f35e315d7a1c48531797f7c4719f3fb0b94ade8a9a726115b1b4" # 쉘에 대한 해시값 넣기
  version "1.1.3"

  def install
    bin.install "fgit.sh" => "fgit"
  end

  test do
    system "#{bin}/fgit", "help"
  end
end