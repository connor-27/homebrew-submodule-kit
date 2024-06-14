class Fgit < Formula
  desc "Custom git aliases for submodule management"
  homepage "https://github.com/connor-27/homebrew-submodule-kit"
  url "https://github.com/connor-27/homebrew-submodule-kit/raw/main/fgit.sh"
  # shasum -a 256 fgit.sh
  sha256 "1acbcf11aa4b0bb5ca0783d903512e406e129b2ffcd13acc38ba98ba97f772b2" # 쉘에 대한 해시값 넣기
  version "1.0.3"

  def install
    bin.install "fgit.sh" => "fgit"
  end

  test do
    system "#{bin}/fgit", "help"
  end
end
