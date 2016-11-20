# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class OtfccMac64 < Formula
  desc "Parses & writes SFNT structures."
  homepage "https://github.com/caryll/otfcc/releases/"
  url "https://github.com/caryll/otfcc/archive/v0.6.1.tar.gz"
  version "0.6.1"
  sha256 "fdbd6e28aa56cc6b1540a6f5447988aa7fc36bcf9069bf7775e8df0b9b773bba"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "./dep/bin-osx/premake5", "xcode4"
    system "xcodebuild",
              "-workspace", "build/xcode/otfcc.xcworkspace",
              "-scheme", "otfccbuild",
              "-configuration", "Release"
    system "xcodebuild",
              "-workspace", "build/xcode/otfcc.xcworkspace",
              "-scheme", "otfccdump",
              "-configuration", "Release"

    bin.install "bin/Release-x64/otfccbuild"
    bin.install "bin/Release-x64/otfccdump"
  end
end
