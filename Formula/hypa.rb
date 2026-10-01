class Hypa < Formula
  desc "Local context runtime and terminal multiplexer for coding agents"
  homepage "https://github.com/Hypabolic/Hypa"
  version "1.0.1"
  license "FSL-1.1-ALv2"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.1/hypa-osx-x64.tar.gz"
      sha256 "6199ee716d81165a18b4033aaf09ba381db4d9ccf94bcd7cb448e7454d4ef767"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.1/hypa-osx-arm64.tar.gz"
      sha256 "19590700ccf2e0f4c55551db15080c55c41b6c796ccac2fad8e477d63bb1b355"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.1/hypa-linux-x64.tar.gz"
      sha256 "7f80567e577ff6b6387e08825531b683cb1b329a8d9672d7711c912728228613"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.1/hypa-linux-arm64.tar.gz"
      sha256 "7d009392fcf1b1ae4210b79d658f1633096884453074508d46db667367718528"
    end
  end

  # The release archive is a self-contained directory. hypa finds hypa-attach,
  # hypa-runtime, hypa-pty-host, libghostty-vt and the native libraries next to
  # its own executable, so keep them together in libexec and link only hypa.
  # The binaries are prebuilt and signed by the release pipeline; relinking
  # them would invalidate the signatures.
  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"hypa"
  end

  test do
    %w[hypa hypa-attach hypa-annotate hypa-runtime hypa-pty-host].each do |program|
      assert_predicate libexec/program, :executable?
    end
    assert_predicate libexec/shared_library("libghostty-vt"), :exist?
    assert_predicate libexec/shared_library("libe_sqlite3"), :exist?

    assert_match version.to_s, shell_output("#{bin}/hypa --version")
  end
end
