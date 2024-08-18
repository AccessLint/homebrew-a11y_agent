class A11yAgent < Formula
  desc "AI agent that fixes accessibility issues"
  homepage "https://github.com/accesslint/a11y-agent"
  url "https://github.com/AccessLint/a11y-agent/releases/download/v0.0.5.pre.alpha.4/a11y_agent-0.0.5.pre.alpha.4.tar.xz"
  sha256 "0e690cb50ebd0dca7a064fc7a0adef8da810c5c85cfbe41e8303c36d83049437"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec

    # Extract all files to libexec, which is a common Homebrew practice for third-party tools
    libexec.install Dir["*"]

    system "bundle", "install", "--without", "development"
    system "gem", "build", "a11y_agent.gemspec"
    system "gem", "install", "--ignore-dependencies", "a11y_agent-0.0.5.pre.alpha.4.gem"

    bin.install libexec/"exe/a11y_agent"
    bin.env_script_all_files(libexec/"exe", GEM_HOME: ENV.fetch("GEM_HOME", nil))
  end

  test do
    # Simple test to check the version or a help command
    system "#{bin}/a11y_agent", "--help"
  end
end
