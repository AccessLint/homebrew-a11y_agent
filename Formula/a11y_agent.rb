class A11yAgent < Formula
  desc "AI agent that fixes accessibility issues"
  homepage "https://github.com/accesslint/a11y-agent"
  url "https://github.com/AccessLint/a11y-agent/releases/download/v0.0.12/a11y_agent-0.0.12.tar.xz"
  sha256 "7bf0f9f7e95bbecd997bd56a802156b49ad2bb636a3dc77ba71cd7cb77761f9e"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec

    # Extract all files to libexec, which is a common Homebrew practice for third-party tools
    libexec.install Dir["*"]

    system "bundle", "install", "--gemfile", libexec/"Gemfile"
    system "gem", "build", libexec/"a11y_agent.gemspec"
    system "gem", "install", "--ignore-dependencies", "a11y_agent-0.0.12.gem"

    bin.install libexec/"exe/a11y_agent"
    bin.env_script_all_files(libexec/"exe", GEM_HOME: ENV.fetch("GEM_HOME", nil))
  end

  test do
    # Simple test to check the version or a help command
    system "#{bin}/a11y_agent", "--help"
  end
end
