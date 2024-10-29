# frozen_string_literal: true

require_relative "futex/version"

module Tlopo
  class Futex
    def initialize(path)
      @path = path
      @fh = nil
    end

    def locked?
      fh = File.open(@path, File::RDWR | File::CREAT, 0o644)
      r = fh.flock(File::LOCK_EX | File::LOCK_NB)
      fh.close
      r != 0
    end

    def lock
      fh = File.open(@path, File::RDWR | File::CREAT, 0o644)
      fh.flock File::LOCK_EX
      @fh = fh
    end

    def release
      @fh.flock File::LOCK_UN
      @fh.close
      rescue IOError
    end

    def synchronize
      lock
      yield
    ensure
      release
    end
  end
end
