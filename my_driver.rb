require File.expand_path(File.dirname(__FILE__) + "/config/config_s3.rb") 
class S3Driver
	def authenticate(username,password)
    yield username=="farhan" and password=="123"
	end
	
	def bytes(path)
	end

	def change_dir(file_from,file_to)
    s3=AWS::S3.new

    bucket_name="em-ftpd-trial-assignment1"

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
	end

	def dir_contents()
    s3=AWS::S3.new

    bucket_name="em-ftpd-trial-assignment1"

    bucket_content=s3.buckets[bucket_name]

    if bucket_content.exists?
      bucket_content.objects.each do |obj|
        puts obj.key
      end
    else
      print "Invalid Bucket Name"
    end
	end

	def delete_dir()
	end

	def delete_file()
	end

	def rename()
	end

	def make_dir()
	end

	def get_file()
	end

	def put_file(directory_name,file_name)
    s3=AWS::S3.new
    bucket_name="em-ftpd-trial-assignment1"
    upload_name=directory_name +"/"+ File.basename(file_name)

    bucket=s3.buckets[bucket_name]
    upload_file=bucket.objects[upload_name]
    upload_file.write(:file=>file_name)

    yield "#{file_name} has been uploaded"

	end
end

