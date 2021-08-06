import json
import boto3
s3_client = boto3.resource('s3')

msg = "test python"
print(msg)

SOURCE_BUCKET = "rmr-source-bucket"
DESTINATION_BUCKET = "rmr-destination-bucket"


def lambda_handler(event, context):

    print(f"event: {event}")

    bucket = s3_client.Bucket(SOURCE_BUCKET)
    dest_bucket = s3_client.Bucket(DESTINATION_BUCKET)
    print(bucket)
    print(dest_bucket)

    for obj in bucket.objects.all():
            dest_key = obj.key
            print(dest_key)
            s3_client.Object(dest_bucket.name, dest_key).copy_from(CopySource = {'Bucket': obj.bucket_name, 'Key': obj.key})

    print("moved successfully.")

    return {
        'statusCode': 200,
        'body': json.dumps('S3 moved successfully!')
    }

