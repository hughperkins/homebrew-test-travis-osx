class Easycl < Formula
  desc "EasyCL formula, adapted from Edward Geist's DeepCL formula"
  homepage "https://github.com/hughperkins/test-travis-osx"
  url "https://github.com/hughperkins/EasyCL/archive/b9023cdf25c10524ad06227275d3756bbe0c0ed2.tar.gz"
  sha256 "96c6061385e850081cfce17673353b41dbf470fc6b6f3a15e047b1d6506ba80e"
  depends_on "cmake"

  resource "clew" do
    url "https://github.com/hughperkins/clew/archive/1d2752564b6af98d24127cdb2d573d3f9ac98f02.tar.gz"
    sha256 "3793f8ed9ce5b0fcd4bf8581e1bb1fb76f1e24a70fea17044ae86bdb24593b66"
  end

  def install
    pwd = Pathname.pwd
    resource("clew").stage pwd/"thirdparty/clew"
    mkdir "build" do
      system "cmake", "-G", "Unix Makefiles", "-DBUILD_TESTS=ON", "-DDEV_RUN_COG=OFF", "-DUSE_CLEW=ON", "-DPROVIDE_LUA_ENGINE=ON", "..", *std_cmake_args
      system "make", "-j", "4"
      system "make", "install"
      system "pwd"
      system "ls ../dist"
      system "cp ../test/*.cl ."
    end
  end

  test do
    system "#{bin}/easycl_unittests"
  end
end
