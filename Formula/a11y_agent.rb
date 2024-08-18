class A11yAgent < Formula
  desc "AI agent that fixes accessibility issues"
  homepage "https://github.com/accesslint/a11y-agent"
  url "https://github.com/AccessLint/a11y-agent/releases/download/v0.0.7/a11y_agent-0.0.7.tar.xz"
  sha256 "8c28235183fed93166510a2923f113903459f50f3137969ad182178fc307ef73"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec

    # Extract all files to libexec, which is a common Homebrew practice for third-party tools
    libexec.install Dir["*"]

    bin.install libexec/"exe/a11y_agent"
    bin.env_script_all_files(libexec/"exe", GEM_HOME: ENV.fetch("GEM_HOME", nil))
  end

  test do
    # Simple test to check the version or a help command
    system "#{bin}/a11y_agent", "--help"
  end
end
