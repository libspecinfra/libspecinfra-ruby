module Libspecinfra::Backend
  class SSH < FFI::AutoPointer
    def self.release(ptr)
      Binding.free(ptr)
    end

    module Binding
      extend FFI::Library
      ffi_lib ['libspecinfra']

      attach_function :new, :backend_ssh_new,
                      [:string], Direct
      attach_function :free, :backend_ssh_free,
                      [Direct], :void
    end
  end
end
