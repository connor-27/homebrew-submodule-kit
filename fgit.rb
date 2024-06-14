class Fgit < Formula
  desc "Custom git aliases for submodule management"
  homepage "https://github.com/connor-27/homebrew-submodule-kit"
  url "https://github.com/connor-27/homebrew-submodule-kit/raw/main/fgit.sh"
  version "1.0.3"
  # shasum -a 256 fgit.sh
  sha256 "94ba0251351f6528ca083e6e4a66758c2a972d7813753841c4ceb47b530e7caa" # 쉘에 대한 해시값 넣기

  def install
    bin.install "fgit.sh" => "fgit"
  end

  test do
    system "#{bin}/fgit", "help"
  end
end
