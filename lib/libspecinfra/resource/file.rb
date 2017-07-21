module Libspecinfra::Resource
  class File < FFI::AutoPointer
    def self.release(ptr)
      Binding.free(ptr)
    end

    def mode
      Binding.mode(self)
    end

    module Binding
      extend FFI::Library
      ffi_lib ['../specinfra/target/debug/libspecinfra.dylib', 'libspecinfra']

      attach_function :free, :resource_file_free,
                      [File], :void
      attach_function :mode, :resource_file_mode,
                      [File], :uint32

    end
  end
end

