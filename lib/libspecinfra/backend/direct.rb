module Libspecinfra::Backend
  class Direct < FFI::AutoPointer
    def self.release(ptr)
      Binding.free(ptr)
    end

    module Binding
      extend FFI::Library
      ffi_lib ['../specinfra/target/debug/libspecinfra.dylib', 'libspecinfra']

      attach_function :new, :backend_direct_new,
                      [], Direct
      attach_function :free, :backend_direct_free,
                      [Direct], :void
    end
  end
end
