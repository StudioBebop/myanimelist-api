module MyAnimeList
  module URLProcessor
    module_function

    def self.process_anime_or_manga_url url
      parts = url.split("/")
      filename = parts[-1]
      extension = filename.split(".")[1]
      filename = filename.split(".")[0]
      filename.gsub!(/[^0-9]/, '')
      filename = filename + "." + extension
      parts[-1] = filename
      url = parts.join "/"

      return url
    end

    def self.process_url(url)
      if url.include? "/anime/" or url.include? "/manga/" or url.include? "/characters/" or url.include? "/voiceactors/"
        url = process_anime_or_manga_url url
      end

      return url
    end

  end
end
