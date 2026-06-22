class Hypa < Formula
  desc "Local context runtime for agentic development"
  homepage "https://github.com/Hypabolic/Hypa"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.6/hypa-osx-x64.tar.gz"
      sha256 "f86a0bdcd76d978f836a06cd00beec423997f1b0da26646a7de2a1c6b69d1e94"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.6/hypa-osx-arm64.tar.gz"
      sha256 "0d7b452476b3d349af9fc0195fbbea37dd326cb4bf5bd209c46987cca9eba6ee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.6/hypa-linux-x64.tar.gz"
      sha256 "95f6e3d23538080c91fd03321e72d4b0256c8654924264bcc6f769b843670707"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.6/hypa-linux-arm64.tar.gz"
      sha256 "5a0462fbf688d20836534d846d296bf15b398706aa6444622ae8a15e8e0f9586"
    end
  end

  def install
    bin.install Dir["hypa-*/hypa"].first => "hypa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
