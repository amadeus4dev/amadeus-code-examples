# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    Generates a photo with mountain
    '''
    response = amadeus.media.files.generated_photos.get(category='MOUNTAIN')
    try:
        import urllib.request
        urllib.request.urlretrieve(response.data['attachmentUri'], 'generated_image.png')
    except ImportError:
        import urllib
        urllib.urlretrieve(response.data['attachmentUri'], 'generated_image.jpg')
except ResponseError as error:
    raise error
