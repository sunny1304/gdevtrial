require './my_driver'

$PORT ="2100"
ENV["PORT"]="2100"

driver S3Driver
port ENV['PORT']