require "ddp/version"

module Ddp
  def self.p(obj)
    puts dumper(obj)
  end

  def self.dumper(obj)
    text = <<-EOF
#{((obj.class.ancestors - obj.class.included_modules).join(" < "))} {
  included_modules:
    #{obj.class.included_modules.join("\n    ")}
  inspect:
    #{obj.inspect}
    EOF

    if obj.methods.include?(:source_location)
      text += "  source_location: #{obj.source_location || "(Opps! this is a C method.)"}\n"
    end
    text += "}"
  end
end
