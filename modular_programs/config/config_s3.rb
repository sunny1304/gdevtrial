require "rubygems"
require "yaml"
require "aws-sdk"

#check credentials from the config/config.yaml file
config_file=File.join(File.dirname(__FILE__),"config.yaml")
config=YAML.load(File.read(config_file))

unless config.kind_of?(Hash)
	puts "Something is wrong in the config.yaml file"
	exit 1     #exit code of 1 means that it wasn’t able to match any of the inputs.
end

s3=AWS.config(config)


