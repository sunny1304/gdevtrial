require File.expand_path(File.dirname(__FILE__) + "/config/config_s3.rb") 

#bucket instance
s3=AWS::S3.new

bucket_name="em-ftpd-trial-assignment1"

(file_from,file_to)=ARGV
#file_from ="todo.txt"
#file_to="farhan/todo.txt"

file_from1=file_from.split("/")[-1]
file_to1=file_to.split("/")[-1]

if file_from1!=file_to1
	puts "You can't change file name, only change directory."
	exit 1

else
	grab_objs=s3.buckets[bucket_name]
	grab_file=grab_objs.objects[file_from]
  if grab_file.exists?
    to_file=grab_objs.objects[file_to]
    if not to_file.exists?
	    grab_file.copy_to(to_file)
      puts "File directory has been changed"
      grab_file.delete
    else
      puts "Destination File Already Exists!"
      end
  else
    puts "Source File Doesn't Exists!"
    end

end



