require 'fileutils'

image_paths = Dir["./train/*.jpg"]
image_paths.each do |image_path|
  category, id = File.basename(image_path).split(".")
  new_path = "./tf_train/#{category}/#{id}.jpg"
  FileUtils.copy(image_path, new_path)
  puts new_path
end
