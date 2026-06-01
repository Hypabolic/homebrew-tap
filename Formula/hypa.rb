class Hypa < Formula
  desc "Local context runtime for agentic development"
  homepage "https://github.com/Hypabolic/Hypa"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.2/hypa-osx-x64.tar.gz"
      sha256 "0622a8c5918cb8ed63e750b0bb1f343f6802a7e79931bf9eb91d193d5268f786"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.2/hypa-osx-arm64.tar.gz"
      sha256 "084bee9c22eb311ea363f33d16b18facff72e8a2c4a10a07a0a7a3fe37ba193e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.2/hypa-linux-x64.tar.gz"
      sha256 "900a9c5c0b2364c67395c535568d2686feb3b04f4417f893ffaa6a7550c93b82"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.2/hypa-linux-arm64.tar.gz"
      sha256 "e6f5a223907ce30e83187bb4c25a2207566f5527ae0c61f315000aa1660b4c68"
    end
  end

  def install
    bin.install Dir["hypa-*/hypa"].first => "hypa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
