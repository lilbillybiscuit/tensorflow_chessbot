import json
import base64
import os

def lambda_handler(event, context):
  #os.system("./tensorflow_chessbot.py")
  #return "Hi"
  text=base64.b64decode(event['body'])
  image = open("/tmp/image.png", "wb")
  image.write(text)
  image.close()
  os.system("./tensorflow_chessbot.py --filepath /tmp/image.png")
  fen=open("/tmp/fen.txt", "r")
  str1=fen.readline()
  fen.close()
  print("Final FEN" + str1)
  return {
    'statusCode': 200,
    'body': str(str1),
    "headers": {
      "Access-Control-Allow-Origin" : "*",
    }
  }
