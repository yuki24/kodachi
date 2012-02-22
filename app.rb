helpers do
  def load_file_from_aws(path)
    @image = Image.find_file(path)
    content_type @image.content.content_type
  end
end

get '/full/*' do |path|
  load_file_from_aws(path)
  @image.content.value
end

get '/rfit/*/*/*' do |width, height, path|
  load_file_from_aws(path)
  @image.resize_to_fit(width.to_i, height.to_i).to_blob
end

get '/rfill/*/*/*' do |width, height, path|
  load_file_from_aws(path)
  @image.resize_to_fill(width.to_i, height.to_i).to_blob
end
