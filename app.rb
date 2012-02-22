helpers do
  def load_file_from_aws(path)
    @image = Image.find_file(path)
    content_type @image.content.content_type
  end
end

get '/full/:path' do
  load_file_from_aws(params[:path])
  @image.content.value
end

get '/rfit/:width/:height/:path' do
  load_file_from_aws(params[:path])
  @image.resize_to_fit(params[:width].to_i,params[:height].to_i).to_blob
end

get '/rfill/:width/:height/:path' do
  load_file_from_aws(params[:path])
  @image.resize_to_fill(params[:width].to_i,params[:height].to_i).to_blob
end
