class Hypa < Formula
  desc "Local context runtime for agentic development"
  homepage "https://github.com/Hypabolic/Hypa"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.5/hypa-osx-x64.tar.gz"
      sha256 "00be2a8966720afdfb4cc8faa1f81922d9c11b88ff21cf314cc0123717bb4598"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.5/hypa-osx-arm64.tar.gz"
      sha256 "cfb7f7715f4b71b0922bd036ae70b12b678503a966ec4e9707999bb5bee87425"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.5/hypa-linux-x64.tar.gz"
      sha256 "51f768a5efc30812605074dc02b73c39ce9f5777d52140ccec54c8f0e061b49d"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.5/hypa-linux-arm64.tar.gz"
      sha256 "ac36bc8134300adb59fbc0120d5dbf89d7033f1557d392e9e3bfc97a1a96fe3d"
    end
  end

  def install
    bin.install Dir["hypa-*/hypa"].first => "hypa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
