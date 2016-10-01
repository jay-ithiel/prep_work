# # Topics
#
# * method_missing
# * blocks
# * strings
# * hashes
#
# # Builder
#
# Here we will implement the so-called Builder Pattern: we will make
# an object, XmlDocument, that *builds* an XML file, which can contain
# arbitrary tags.
#
# Stuff you'll learn:
# * method_missing
# * nested closures
# * x"builder pattern"

class XmlDocument

  def initialize(indent_bool = false)
    @indent_bool = indent_bool
    @indent_length = 0
  end

  def method_missing(method_name, args = {}, &blk)
    if block_given?
      if @indent_bool
        return "#{open_tag(method_name)}#{whitespace}#{blk.call}#{close_tag(method_name)}"
      else
        return "#{open_tag(method_name)}#{blk.call}#{close_tag(method_name)}"
      end
    end

    tagged_method_name = add_tag(method_name)
    if args.count == 0
      "#{tagged_method_name}"
    else
      first_key = args.keys[0].to_s
      first_val = args.values[0]
      add_tag("#{method_name} #{first_key}=\"#{first_val}\"")
    end
  end

  def whitespace
    "  " * @indent_length
  end

  def open_tag(element)
    @indent_length += 1
    @indent_bool ? "<#{element}>\n" : "<#{element}>"
  end

  def close_tag(element)
    @indent_length -= 1
    @indent_bool ? "#{whitespace}</#{element}>\n" : "</#{element}>"
  end

  def add_tag(element)
    @indent_bool ? "<#{element}/>\n" : "<#{element}/>"
  end
end
