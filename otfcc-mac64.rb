# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class OtfccMac64 < Formula
  desc "Parses & writes SFNT structures."
  homepage "https://github.com/caryll/otfcc/releases/"
  url "https://github.com/caryll/otfcc/archive/v0.9.1.tar.gz"
  version "0.9.1"
  sha256 "47376af3453dcde4147d2b7adb586d9577d2cf37eb6463536a5398f7872de073"

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
