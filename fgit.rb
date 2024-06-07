class Fgit < Formula
  desc "Custom git aliases for submodule management"
  homepage "https://github.com/connor-27/homebrew-submodule-kit"
  url "https://github.com/connor-27/homebrew-submodule-kit/raw/main/fgit.sh"
  version "1.0.1"
  # shasum -a 256 fgit.sh
  sha256 "4fee36de83e16fc855d650e031d2de08c21d9cdaeeb1ee5b3d5aebbba1f25d2d"  # 쉘에 대한 해시값 넣기

  def install
    bin.install "fgit.sh" => "fgit"
  end

  test do
    system "#{bin}/fgit", "help"
  end
end
