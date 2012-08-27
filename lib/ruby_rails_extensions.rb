require "ruby_rails_extensions/version"

require "ruby_rails_extensions/globals"
require "ruby_rails_extensions/core/array_extensions"
require "ruby_rails_extensions/core/class_extensions"
require "ruby_rails_extensions/core/hash_extensions"
require "ruby_rails_extensions/core/module_extensions"
require "ruby_rails_extensions/core/object_extensions"
require "ruby_rails_extensions/core/string_extensions"

if Object.const_defined? "ActionView"
  require "ruby_rails_extensions/helpers/form_helper"
end

require "ruby_rails_extensions/utilities/regex_helper"


