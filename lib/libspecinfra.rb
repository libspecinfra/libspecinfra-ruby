require 'libspecinfra/version'
require 'ffi'

require 'libspecinfra/backend'
require 'libspecinfra/backend/direct'

module Libspecinfra
  def self.new(backend)
    Specinfra::Binding.new(backend)
  end

  class Specinfra < FFI::AutoPointer
    def self.release(ptr)
      Binding.free(ptr)
    end

    def echo
      Binding.echo(self)
    end

    module Binding
      extend FFI::Library
      ffi_lib ['../specinfra/target/debug/libspecinfra.dylib', 'libspecinfra']

      attach_function :new, :specinfra_new,
                      [:pointer], Specinfra
      attach_function :free, :specinfra_free,
                      [Specinfra], :void
    end
  end
end







