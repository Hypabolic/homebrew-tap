class Hypa < Formula
  desc "Local context runtime for agentic development"
  homepage "https://github.com/Hypabolic/Hypa"
  version "0.1.15"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.15/hypa-osx-x64.tar.gz"
      sha256 "e179fcb1c09b40eb917e6112570a7858f9d47fc4926816a90f2c567d3fa0710a"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.15/hypa-osx-arm64.tar.gz"
      sha256 "ded5cd90bedf2904c1ac14f812f62af8425c4e3ceb902b39e9372ee361d08e7f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.15/hypa-linux-x64.tar.gz"
      sha256 "c3e2e41d36534fdfccfd51797544259041ae0e8e8be898ac427bd96a455caac9"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.15/hypa-linux-arm64.tar.gz"
      sha256 "993827ddceb70a3e65d122302f36caa107e987dd25692c4a43ddfbb72ebddc82"
    end
  end

  def install
    bin.install Dir["hypa-*/hypa"].first => "hypa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
