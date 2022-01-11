import os
import boto3
from flask import request
from flask import render_template
from flask import Flask

access_key_id = os.getenv('AWS_ACCESS_KEY_ID')
secret_key = os.environ.get('AWS_SECRET_ACCESS_KEY')
bucket_name = os.environ.get('BUCKET_NAME')

# current module (__name__) as argument.
app = Flask(__name__)

session = boto3.Session( 
         aws_access_key_id = str(access_key_id), 
         aws_secret_access_key = str(secret_key)
)

#Then use the session to get the resource
s3 = session.resource('s3')

my_bucket = s3.Bucket(str(bucket_name))

@app.route('/')
# ‘/’ URL is bound with the listS3 function.
def lists3():
    if my_bucket.name != '' :
           list = []
           for my_bucket_object in my_bucket.objects.all():
               list.append(my_bucket_object.key)
           return render_template("index.html", data=list, bucket_name=my_bucket.name)
    else:
        return ("<p>Bucket doesn't exists!</p>") 

# main driver function
if __name__ == '__main__':
	app.run()