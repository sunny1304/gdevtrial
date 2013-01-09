require File.expand_path(File.dirname(__FILE__) + "/config/config_s3.rb") 

#bucket instance
s3=AWS::S3.new

(directory_name,file_name)=ARGV

bucket_name="em-ftpd-trial-assignment1"

unless file_name
	puts "upload_s3.rb <directory_name> <file_name>"
	exit 1
end

upload_name=directory_name +"/"+ File.basename(file_name)

bucket=s3.buckets[bucket_name]
upload_file=bucket.objects[upload_name]
upload_file.write(:file=>file_name)

puts "#{file_name} has been uploaded"





