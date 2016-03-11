class XmlDocument
  
  attr_reader :indent
  
  def initialize(indent = false)
    @indent = indent
    @indent_depth = 0
  end
  
  def method_missing(name, *attrs, &blk)
    attrs = attrs.first || {}
    create_tag(name, attrs, &blk)
  end
  
  def create_tag(name, attrs, &blk)
    xml_tag = ""
    
    if block_given?
      xml_tag += open_tag(name, attrs)
      indent
      xml_tag += blk.call
      unindent
      xml_tag += close_tag(name, attrs)
    else
      xml_tag += lone_tag(name, attrs)
    end
    xml_tag
  end
  
  def open_tag(name, attrs)
    tag = "#{tab_space}<#{name}"
    attrs.empty? ? tag += ">" : tag += " #{attributes_string(attrs).join(" ")}>"
    tag += new_line
    tag
  end
  
  def close_tag(name, attrs)
    tag = "#{tab_space}</#{name}"
    attrs.empty? ? tag += ">" : tag += " #{attributes_string(attrs).join(" ")}/>"
    tag += new_line
    tag
  end
  
  def lone_tag(name, attrs)
    tag = "#{tab_space}<#{name}"
    attrs.empty? ? tag += "/>" : tag += " #{attributes_string(attrs).join(" ")}/>"
    tag += new_line
    tag
  end
  
  def attributes_string(attrs)
    attrs.map { |key, value| "#{key}=\"#{value}\""}
  end
  
  def indent
    @indent_depth += 1 if @indent
  end
  
  def unindent
    @indent_depth -= 1 if @indent
  end
  
  def tab_space
    "  " * @indent_depth
  end
  
  def new_line
    @indent ? "\n" : ""
  end
  
end