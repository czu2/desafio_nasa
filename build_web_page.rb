require_relative 'request'
require_relative 'components'

rovers = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=j1Fo6d35iPFZci2I4yDARkBZb6vL6UjjQ97frLJ1")

def buid_web_page(rovers)
    photos_rovers = rovers['photos']
    content = head() + title(photos_rovers) + rovers(photos_rovers).to_s + foot()
    File.write('./index.html', content)
end

buid_web_page(rovers)
