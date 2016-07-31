# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class OtfccMac64 < Formula
  desc "Parses & writes SFNT structures."
  homepage "https://github.com/caryll/otfcc/releases/"
  url "https://github.com/caryll/otfcc/archive/v0.3.0.tar.gz"
  version "0.3.0"
  sha256 "6cfbc0984712b9e7037966998a495255e8bf8656a9e9120bd78644dbde43f2b4"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "./dep/bin-osx/premake5", "xcode4"
    system "xcodebuild", "-workspace", "build/xcode/otfcc.xcworkspace", "-scheme", "otfccbuild", "-configuration", "Release"
    system "xcodebuild", "-workspace", "build/xcode/otfcc.xcworkspace", "-scheme", "otfccdump", "-configuration", "Release"

    bin.install "bin/Release-x64/otfccbuild"
    bin.install "bin/Release-x64/otfccdump"
  end
end
