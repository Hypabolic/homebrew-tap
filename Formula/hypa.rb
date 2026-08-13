class Hypa < Formula
  desc "Local context runtime for agentic development"
  homepage "https://github.com/Hypabolic/Hypa"
  version "0.1.14"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.14/hypa-osx-x64.tar.gz"
      sha256 "188c98221568417638e91d26de9db2a28c7d0f07613ed9031e8e3c715314f751"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.14/hypa-osx-arm64.tar.gz"
      sha256 "48523068fd12b95aab59e0f4ea84a0e5032a4aa75f7f22b7e7ec06b8fe1c96b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.14/hypa-linux-x64.tar.gz"
      sha256 "1735d893737dc7984269f2a0960117853e34a636bd32889ea82e31ac51949012"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.14/hypa-linux-arm64.tar.gz"
      sha256 "218fa3fbf0034c809e9d8eaf37bf6145b475b18f032e1e58d0c3cce2ec1dc146"
    end
  end

  def install
    bin.install Dir["hypa-*/hypa"].first => "hypa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
