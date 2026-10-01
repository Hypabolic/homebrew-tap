class Hypa < Formula
  desc "Local context runtime and terminal multiplexer for coding agents"
  homepage "https://github.com/Hypabolic/Hypa"
  version "1.0.2"
  license "FSL-1.1-ALv2"

  on_macos do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.2/hypa-osx-x64.tar.gz"
      sha256 "11f40a4191609520b8b49100fd01315bf85c0416e229d5444506a5f7f5a42082"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.2/hypa-osx-arm64.tar.gz"
      sha256 "0bdd0e15a8745776a770bf3b2efd82c2b7122a88983a2bc6b8a3efb301f4cf89"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.2/hypa-linux-x64.tar.gz"
      sha256 "0e40991f6e7616e11c222d536929ab97a897fba8b14de3237bb5be9e435b6f9d"
    end
    on_arm do
      url "https://github.com/Hypabolic/Hypa/releases/download/v1.0.2/hypa-linux-arm64.tar.gz"
      sha256 "2e45bffe85c1fbb60fd0024177d323f6642869753487ce81cd0b598d8d20b57f"
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
