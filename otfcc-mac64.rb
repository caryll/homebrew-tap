# Documentation: https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class OtfccMac64 < Formula
  desc "Parses & writes SFNT structures."
  homepage "https://github.com/caryll/otfcc/releases/"
  url "https://github.com/caryll/otfcc/releases/download/v0.2.3/otfcc-mac64-0.2.3.tar.xz"
  version "0.2.3"
  sha256 "f393b14f9c42c890b8a60949b13a8f9b5c3f814daa8b18901656ccc3b866f646"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # system "tar -Jvxf otfcc-mac64-0.2.3.tar.zx"
    bin.install "otfccbuild"
    bin.install "otfccdump"
  end

end
