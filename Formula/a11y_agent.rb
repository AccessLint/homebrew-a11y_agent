class A11yAgent < Formula
  desc "AI agent that fixes accessibility issues"
  homepage "https://github.com/accesslint/a11y-agent"
  url "https://github.com/AccessLint/a11y-agent/releases/download/v0.0.3/a11y_agent-0.0.3.tar.xz"
  sha256 "6b01bd85fd5e764fd38595d305442d23afb40eff7357cba7b1c229fb9afc366a"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec

    # Extract all files to libexec, which is a common Homebrew practice for third-party tools
    libexec.install Dir["*"]

    bin.install libexec/"bin/a11y_agent"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV.fetch("GEM_HOME"))
  end

  test do
    # Simple test to check the version or a help command
    system "#{bin}/a11y_agent", "--help"
  end
end
