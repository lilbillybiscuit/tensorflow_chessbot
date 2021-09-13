import json
import base64

def lambda_handler(event, context):
  text=base64.b64decode(event['body'])
  image = open("image.png", "wb")
  image.write(base64.b64decode(data))
  image.close()
