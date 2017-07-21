require 'libspecinfra/version'
require 'ffi'

require 'libspecinfra/backend'
require 'libspecinfra/backend/direct'

require 'libspecinfra/resource'
require 'libspecinfra/resource/file'

module Libspecinfra
  def self.new(backend)
    Specinfra::Binding.new(backend)
  end

  class Specinfra < FFI::AutoPointer
    def self.release(ptr)
      Binding.free(ptr)
    end


    def file(name)
      Binding.file(self, name)
    end

    module Binding
      extend FFI::Library
      ffi_lib ['../specinfra/target/debug/libspecinfra.dylib', 'libspecinfra']

      attach_function :new, :specinfra_new,
                      [:pointer], Specinfra
      attach_function :free, :specinfra_free,
                      [Specinfra], :void
      attach_function :file, :specinfra_file,
                      [Specinfra, :string], Resource::File
    end
  end
end
