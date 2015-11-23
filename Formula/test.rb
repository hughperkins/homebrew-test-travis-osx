class Test < Formula
  desc "test formula"
  homepage "https://github.com/hughperkins/test-travis-osx"
  depends_on "jpeg"
  depends_on "cmake"

  def install
    pwd = Pathname.pwd
    mkdir "build2" do
      system "cmake", "-G", "Unix Makefiles", "..", "std_cmake_args"
      system "make", "-j", "4"
    end
  end

  test do
    system "#{bin}/hugh_test"
  end
end
