
# Requires Node 12.7.3, npm 10.5.0
mkdir uploads # Saves all the file upload from client
touch config.js
cp config.sample.js config.js
touch .env # Place your port and mongo URL and mailgun data here
npm i
npm run start

