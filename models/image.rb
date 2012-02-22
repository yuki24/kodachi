class Image
  include CarrierWave::MiniMagick
  attr_writer :content

  def path
    "#{file_path}/#{filename}"
  end

  def content
    @content ||= AWS::S3::S3Object.find(path, S3_CONFIG.bucket)
  end

  class << self
    def find_file(path)
      Image.new.tap do |image|
        image.content = AWS::S3::S3Object.find(path, S3_CONFIG.bucket)
      end
    end
  end

 private

  ##
  # Manipulate the image with MiniMagick. This method will load up an image
  # and then pass each of its frames to the supplied block. This method is
  # originally defined in CarrierWave::MiniMagick module. But sinse we use Heroku,
  # we can not write anything under /tmp. So We remove the file I/O part.
  #
  # === Yields
  #
  # [MiniMagick::Image] manipulations to perform
  #
  # === Raises
  #
  # [CarrierWave::ProcessingError] if manipulation failed.
  #
  def manipulate!
    image = ::MiniMagick::Image.read(content.value)
    image = yield(image)
  rescue ::MiniMagick::Error, ::MiniMagick::Invalid => e
    raise CarrierWave::ProcessingError, I18n.translate(:"errors.messages.mini_magick_processing_error", :e => e)
  end
end
