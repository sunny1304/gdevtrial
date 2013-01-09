require File.expand_path(File.dirname(__FILE__)+"/config/config_s3.rb")

s3=AWS::S3.new

bucket_name=ARGV.first

unless bucket_name
	puts "file_info.rb <bucket_name>"
	exit 1
end

bucket_content=s3.buckets[bucket_name]

if bucket_content.exists?
	bucket_content.objects.each do |obj|
		puts obj.key
	end
else
	print "Invalid Bucket Name"
end



