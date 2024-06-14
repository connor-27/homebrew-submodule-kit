class Fgit < Formula
  desc "Custom git aliases for submodule management"
  homepage "https://github.com/connor-27/homebrew-submodule-kit"
  url "https://github.com/connor-27/homebrew-submodule-kit/raw/main/fgit.sh"
  # shasum -a 256 fgit.sh
  sha256 "86bf9c3c9b0ae31b0915d52a6d657ec40c3c32b074861b3af9c6f9df6f1fdb3c" # 쉘에 대한 해시값 넣기
  version "1.0.5"

  def install
    bin.install "fgit.sh" => "fgit"
  end

  test do
    system "#{bin}/fgit", "help"
  end
end