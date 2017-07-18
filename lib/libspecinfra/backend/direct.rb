class Libspecinfra::Backend::Direct < FFI::AutoPointer
  def self.release(ptr)
    Binding.free(ptr)
  end

  module Binding
    extend FFI::Library
    ffi_lib '../specinfra/target/debug/libspecinfra.dylib'

    attach_function :new, :backend_direct_new,
                    [], Libspecinfra::Backend::Direct

    attach_function :free, :backend_direct_free,
                    [Libspecinfra::Backend::Direct], :void

  end
end
