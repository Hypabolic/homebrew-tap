class Hypa < Formula
  desc "Local context runtime for agentic development"
  homepage "https://github.com/Hypabolic/Hypa"
  version "0.1.9"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.9/hypa-osx-x64.tar.gz"
      sha256 "4a44417a493f42cd01d8185cb19f61d7af768a21ca2f38906024ca29b41b526a"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.9/hypa-osx-arm64.tar.gz"
      sha256 "ed16cdf33d29cc4cbeeb491ab7b79c6b8860b06a66409e8287d43fdd56948c5a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.9/hypa-linux-x64.tar.gz"
      sha256 "834c9845fed414c1892ff8224233c33833eebdb0883a1bad40f1263fd5cbdd09"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.9/hypa-linux-arm64.tar.gz"
      sha256 "b28ec3cd3a8d63c6f5b99dd8310760a632b67a0327fea4df4aa7a7b2e8a32342"
    end
  end

  def install
    bin.install Dir["hypa-*/hypa"].first => "hypa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
