require 'libspecinfra/backend/ssh'

module Libspecinfra::Backend
  class SSHBuilder < FFI::AutoPointer
    def self.release(ptr)
      Binding.free(ptr)
    end

    def user(user)
      Binding.user(self, user)
    end

    def password(password)
      Binding.password(self, password)
    end

    def key_file(key_file)
      Binding.key_file(self, key_file)
    end

    def port(port)
      Binding.port(self, port)
    end

    def finalize()
      Binding.finalize(self)
    end

    module Binding
      extend FFI::Library
      ffi_lib ['libspecinfra']

      attach_function :new, :backend_ssh_builder_new,
                      [:string], SSHBuilder
      attach_function :user, :backend_ssh_builder_user,
                      [:pointer, :string], SSHBuilder
      attach_function :password, :backend_ssh_builder_password,
                      [:pointer, :string], SSHBuilder
      attach_function :key_file, :backend_ssh_builder_key_file,
                      [:pointer, :string], SSHBuilder
      attach_function :port, :backend_ssh_builder_port,
                      [:pointer, :int], SSHBuilder
      attach_function :finalize, :backend_ssh_builder_finalize,
                      [:pointer], :pointer
      attach_function :free, :backend_ssh_builder_free,
                      [SSHBuilder], :void
    end
  end
end

