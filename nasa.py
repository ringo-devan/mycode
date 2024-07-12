#nasa

import requests

url = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY"

for x in range(31):
    y= requests.get(url)
    print(x + 1, y.status_code)
    
