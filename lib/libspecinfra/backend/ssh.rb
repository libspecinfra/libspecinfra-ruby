require 'libspecinfra/backend/ssh_builder'

module Libspecinfra::Backend
  class SSH < FFI::AutoPointer
    def self.release(ptr)
      Binding.free(ptr)
    end

    module Binding
      extend FFI::Library
      ffi_lib ['libspecinfra']

      def self.new(host, user, options={})
        b = SSHBuilder::Binding.new(host).user(user)

        if options[:password]
          b = b.password(options[:password])
        end

        if options[:key_file]
          b = b.key_file(options[:key_file])
        end

        if options[:port]
          b = b.port(options[:port])
        end

        b.finalize()
      end

      attach_function :free, :backend_ssh_free,
                      [SSH], :void
    end
  end
end
