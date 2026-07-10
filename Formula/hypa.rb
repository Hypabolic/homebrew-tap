class Hypa < Formula
  desc "Local context runtime for agentic development"
  homepage "https://github.com/Hypabolic/Hypa"
  version "0.1.10"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.10/hypa-osx-x64.tar.gz"
      sha256 "f6f0d9a43e1a3617396ab2fafb8dd94158617c22c3c8a07aff400aa87caa8239"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.10/hypa-osx-arm64.tar.gz"
      sha256 "518b017a7f7bdce0b3ebb86b065cfbf93e5b11e9c823936a5bfee08f7e3cff71"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.10/hypa-linux-x64.tar.gz"
      sha256 "91d1eb66b7dbe8dfdc16f2699e7f0f768691b1b070c4ac40b3ada0c462ba4c59"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v0.1.10/hypa-linux-arm64.tar.gz"
      sha256 "46d441e792fbee16ce636f892dd24d38b93429786cf420e34676181ca7ab6fa6"
    end
  end

  def install
    bin.install Dir["hypa-*/hypa"].first => "hypa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
