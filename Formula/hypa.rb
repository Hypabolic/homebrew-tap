class Hypa < Formula
  desc "Local context runtime for agentic development"
  homepage "https://github.com/Hypabolic/Hypa"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.3/hypa-osx-x64.tar.gz"
      sha256 "8b8f22ce34f72cc03ece945f64212520fae6ce5de65baee6610a98052ffdfae8"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.3/hypa-osx-arm64.tar.gz"
      sha256 "a0fff9b02fd64b9683b70aa1cb92ec76d9049b79f4fcceeb2e36ce25ddf4db99"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.3/hypa-linux-x64.tar.gz"
      sha256 "9ef7cc6142f2877185386616b3e5816322bd0b09dec9482195fff2c8e1ef267c"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.3/hypa-linux-arm64.tar.gz"
      sha256 "5c936ef1938738490d0c9afa89216c1c9b660acf9b61df991990ad8b0535f58a"
    end
  end

  def install
    bin.install Dir["hypa-*/hypa"].first => "hypa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
