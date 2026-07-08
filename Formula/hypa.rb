class Hypa < Formula
  desc "Local context runtime for agentic development"
  homepage "https://github.com/Hypabolic/Hypa"
  version "0.1.8"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.8/hypa-osx-x64.tar.gz"
      sha256 "a3ec272ab1baae600ddfe95deabaf3b9c7e8d36389cb7dacabc2b028f4af1281"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.8/hypa-osx-arm64.tar.gz"
      sha256 "9d93574c20a91da48b61cf8305b0e5816c8f4ccad92f11fcca29ae4dabe4dc15"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.8/hypa-linux-x64.tar.gz"
      sha256 "b14aa26ef4c06912031f9edcba187e967741b1234d2cba849d33e3e2d5232c30"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.8/hypa-linux-arm64.tar.gz"
      sha256 "56c772ff9c5054db9c3400f0fcd5840cd6d8113cb9cc0363ae629605fdcf3430"
    end
  end

  def install
    bin.install Dir["hypa-*/hypa"].first => "hypa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
