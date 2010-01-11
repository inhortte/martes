# AFewDefaults

class << ActiveRecord::Base
  def default_find_option(*args)
    @default_find_options ||= { }
    if args[0].is_a?(Hash)
      @default_find_options.merge!(args)
    else
      option_name, value = args
      @default_find_options[option_name] = value
    end
  end

  private

  alias_method :orig_find_every, :find_every
  def find_every(*args)
    options = args.is_a?(Hash) ? args : args.pop
    @default_find_options ||= { }
    orig_find_every(@default_find_options.merge(options))
  end
end
