# Build python-flask-app image
docker build -t caitanyakotla/udacity-krishnac .

# List docker images
docker images

# Run Python-flask-app container
docker run -d -p 5000:5000 caitanyakotla/udacity-krishnac