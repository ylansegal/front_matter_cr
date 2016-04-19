require "./front_matter/*"
require "markdown"
require "yaml"
require "toml"

module FrontMatter
  alias Type = Hash(String, TOML::Type) | Hash(YAML::Type, YAML::Type)

  def self.extract(io : IO) : Array(Type | String)
    matter = read_front_matter(io)
    content = ""
    begin
      loop do
        line = io.read_line
        content += line
      end
    rescue
      return [matter, content]
    end
  end

  def self.read_front_matter(io)
    start = io.read_line
    case start
    when "---\n"
      return read_yaml(io).as_h
    when "+++\n"
      return read_toml(io)
    else
      raise "not match"
    end
  end

  def self.read_yaml(io)
    begin
      yaml = ""
      loop do
        line = io.read_line
        if line.match(/---/)
          return YAML.parse(yaml)
        end
        yaml += line
      end
      raise "End of FromtMatter Not Found"
    end
  end

  def self.read_toml(io)
    begin
      toml = ""
      loop do
        line = io.read_line
        if line.match(/\+\+\+/)
          return TOML.parse(toml)
        end
        toml += line
      end
      raise "End of FromtMatter Not Found"
    end
  end
end
